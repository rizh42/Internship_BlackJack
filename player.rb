require_relative 'game'
require_relative 'card'

class Player
  attr_accessor :name, :current_money, :cards, :current_sum

  def initialize(name = 'anon')
    @name = name
    @current_money = 100
    @cards = [Card.new, Card.new]
    @current_sum = sum
  end

  def recieve_card
    @cards << Card.new
    @current_sum = sum
  end

  def bet
    @current_money -= 10
  end

  def sum
    sum = 0
    cards.each do |card|
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
