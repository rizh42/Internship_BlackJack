require_relative 'card'

class Deck
  def initialize
    @all_cards = []
    build_deck
    @all_cards.shuffle!
  end

  def card
    @all_cards.delete_at(0)
  end

  private

  attr_accessor :all_cards

  def build_deck
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @all_cards << Card.new(rank, suit)
      end
    end
  end
end
