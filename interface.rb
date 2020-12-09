require_relative 'game'

class Interface
  attr_accessor :name

  def initialize
    puts 'Hello, enter your name:'
    @name = gets.chomp!
    puts 'List of available commands:'
    puts 'a) Miss a turn'
    puts 'b) Add a card'
    puts 'c) Open cards'
    start_game
  end

  def start_game
    puts 'The game has started'
    @game = Game.new(name)
    @game.bet
    puts 'Enter command:'
    choice
    loop do
      puts '-------------------'
      puts "Play again?\nYes/No"
      cmd = gets.chomp!
      if cmd == 'Yes'
        puts '+++++++++++++'
        start_game
      else
        break
      end
    end
  end

  def choice
    loop do
      show_current_situation
      command = gets.chomp!
      if end_condition
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

  def end_condition
    (@game.player.hand.cards.length < 3 && @game.player.sum <= 21) && (@game.dealer.hand.cards.length < 3 && @game.dealer.sum <= 21)
  end

  def show_current_situation
    puts 'Your cards:'
    @game.player.hand.cards.each do |card|
      puts "#{card.rank}#{card.suit}"
    end
    puts "Dealer's cards:"
    @game.dealer.hand.cards.each do
      puts '*'
    end
  end

  def test_win
    case @game.win
    when 'dealer'
      puts 'Dealer wins!'
    when 'draw'
      puts 'Draw'
    when 'player'
      puts 'Player wins!'
    end
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
    test_win
  end
end
