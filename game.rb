require_relative 'dealer'
require_relative 'player'

class Game
  attr_accessor :player, :dealer, :current_bet, :current_deck

  def initialize(name)
    @current_deck = Deck.new
    @player = Player.new(current_deck, name)
    @dealer = Dealer.new(current_deck)
    @current_bet = 0
  end

  def recieve_card
    player.hand.recieve_card
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
    if @player.sum == 21 || ((21 - @player.sum) > (21 - @dealer.sum) && @player.sum < 21)
      winner = "player"
      @player.current_money += current_bet
      @current_bet = 0
    elsif @player.sum == @dealer.sum
      winner = "draw"
      @dealer.current_money += 10
      @player.current_money += 10
      @current_bet = 0
    else 
      winner = "dealer"
      @dealer.current_money += current_bet
      @current_bet = 0
    end
    winner
  end
end
