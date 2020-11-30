require_relative 'player'

class Dealer < Player
  def initialize
    super('Dealer')
  end

  def make_move
    if @current_sum >= 17 || @current_cards.length == 3
      return
    else
      recieve_card
    end
  end
end
