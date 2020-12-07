class Deck
  attr_accessor :all_cards

  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"].freeze

  def initialize
    @all_cards = []
    build_deck
    @all_cards.shuffle!
  end

  def card
    @all_cards.delete_at(0)
  end

  private

  def build_deck
    RANKS.each do |rank|
      SUITS.each do |suit|
        @all_cards << rank + suit
      end
    end
  end
end
