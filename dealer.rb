require_relative 'player'

class Dealer < Player
  def initialize(deck)
    super(deck, 'Dealer')
  end

  def make_move
    recieve_card unless sum >= 17 || hand.cards.length == 3
  end
end
