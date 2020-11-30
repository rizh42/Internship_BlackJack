require_relative 'dealer'
require_relative 'player'

class Game
  attr_accessor :player, :dealer, :current_bet

  def initialize(name)
    @player = Player.new(name)
    @dealer = Dealer.new
    @current_bet = 0
  end

  def recieve_card
    player.recieve_card
  end

  def bet
    player.bet
    dealer.bet
    @current_bet += 20
  end

  def dealer_move
    dealer.make_move
  end

  def win
    flag = 0
    if @player.current_sum == 21 || ((21 - @player.current_sum) > (21 - @dealer.current_sum) && @player.current_sum < 21)
      flag = 1
      @player.current_money += current_bet
      @current_bet = 0
    elsif @player.current_sum == @dealer.current_sum
      flag = 0
      @dealer.current_money += 10
      @player.current_money += 10
      @current_bet = 0
    else 
      flag = -1
      @dealer.current_money += current_bet
      @current_bet = 0
    end
    flag
  end
end
