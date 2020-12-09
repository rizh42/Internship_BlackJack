class Hand
  attr_accessor :cards, :current_deck, :current_sum

  def initialize(deck)
    @current_deck = deck
    @cards = [current_deck.card, current_deck.card]
    @current_sum = sum
  end

  def recieve_card
    @cards << current_deck.card
    @current_sum = sum
  end

  def sum
    sum = 0
    aces = 0
    @cards.each do |card|
      if card.ace?
        sum += 11
        aces += 1
      elsif card.picture?
        sum += 10
      else
        sum += card.rank.to_i
      end
    end
    check_aces(sum, aces)
    sum
  end

  def check_aces(sum, aces)
    while aces > 0
      if sum > 21
        sum -= 10
        aces -= 1
      end
      aces -= 1
    end
  end
end
