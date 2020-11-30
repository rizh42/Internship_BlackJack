require_relative 'game'

class Interface
  def initialize
    puts 'Hello, enter your name:'
    name = gets.chomp!
    @game = Game.new(name)
    puts 'List of available commands:'
    puts 'a) Miss a turn'
    puts 'b) Add a card'
    puts 'c) Open cards'
    start_game
  end

  def start_game
    puts 'The game has started'
    @game.bet
    puts 'Enter command:'
    loop do
      show_current_situation
      command = gets.chomp!
      if @game.player.cards.length < 3
        case command
        when 'a'
          @game.dealer_move
        when 'b'
          @game.recieve_card
          @game.dealer_move
        when 'c'
          open_cards
          break
        else
          puts 'Wrong command!'
        end
      else
        puts 'Too much cards'
        puts "It's time to open cards!"
        open_cards
        break
      end
    end
  end

  def show_current_situation
    puts 'Your cards:'
    @game.player.cards.each do |card|
      puts "#{card.rank}#{card.suit}"
    end
    puts "Dealer's cards:"
    puts '*******'
  end

  def open_cards
    puts 'Your cards:'
    @game.player.cards.each do |card|
      puts "#{card.rank}#{card.suit}"
    end
    puts "Dealer's cards:"
    @game.dealer.cards.each do |card|
      puts "#{card.rank}#{card.suit}"
    end
    case @game.win
    when -1
      puts 'Dealer wins!'
    when 0
      puts "Draw"
    when 1
      puts 'Player wins!'
    end
  end
end