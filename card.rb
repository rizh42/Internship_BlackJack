class Card
  attr_accessor :rank, :suit

  def initialize(deck)
    current_card = deck.card
    @rank = current_card[0]
    @suit = current_card[1]
  end
end