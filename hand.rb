require_relative 'card'

class Hand
  attr_accessor :cards, :current_deck, :current_sum

  def initialize(deck)
    @current_deck = deck
    @cards = [Card.new(current_deck), Card.new(current_deck)]
    @current_sum = sum
  end

  def recieve_card
    @cards << Card.new(current_deck)
    @current_sum = sum
  end

  def sum
    sum = 0
    @cards.each do |card|
      if card.rank == 2..10
        sum += card.rank
      else
        if card.rank == 'A'
          if sum <= 10
            sum += 11
          else
            sum += 1
          end
        else
          sum += 10
        end
      end
    end
    return sum
  end
end