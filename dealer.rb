require_relative 'player'

class Dealer < Player
  def initialize(deck)
    super(deck, 'Dealer')
  end

  def make_move
    recieve_card unless @hand.current_sum >= 17 || @hamd.cards.length == 3
  end
end
