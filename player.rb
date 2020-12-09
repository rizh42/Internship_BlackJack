require_relative 'game'
require_relative 'deck'
require_relative 'hand'

class Player
  attr_accessor :name, :current_money, :cards, :current_sum, :hand

  def initialize(deck, name = 'anon')
    @name = name
    @current_money = 100
    @hand = Hand.new(deck)
  end

  def sum
    hand.current_sum
  end

  def recieve_card
    hand.recieve_card
  end

  def bet
    @current_money -= 10
  end
end
