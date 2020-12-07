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
    choice
  end

  def choice
    loop do
      show_current_situation
      command = gets.chomp!
      if (@game.player.hand.cards.length < 3 || @game.player.sum >= 21) && (@game.dealer.hand.cards.length < 3 || @game.dealer.sum >= 21)
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
        puts "It's time to open cards!"
        open_cards
        break
      end
    end
  end

  def show_current_situation
    puts 'Your cards:'
    @game.player.hand.cards.each do |card|
      puts "#{card.rank}#{card.suit}"
    end
    puts "Dealer's cards:"
    puts '*******'
  end

  def open_cards
    puts 'Your cards:'
    @game.player.hand.cards.each do |card|
      puts "#{card.rank}#{card.suit}"
    end
    puts "Your points: #{@game.player.sum}"
    puts "Dealer's cards:"
    @game.dealer.hand.cards.each do |card|
      puts "#{card.rank}#{card.suit}"
    end
    puts "Dealer's points: #{@game.dealer.sum}"
    case @game.win
    when 'dealer'
      puts 'Dealer wins!'
    when 'draw'
      puts 'Draw'
    when 'player'
      puts 'Player wins!'
    end
  end
end
