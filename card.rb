class Card
  attr_accessor :rank, :suit

  def initialize(deck)
    current_card = deck.card
    if current_card.length == 2
      @rank = current_card[0]
      @suit = current_card[1]
    else
      @rank = current_card[0] + current_card[1]
      @suit = current_card[2]
    end
  end
end
