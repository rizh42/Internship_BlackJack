class Card
  attr_reader :rank, :suit

  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"].freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ace?
    @rank == 'A'
  end

  def picture?
    @rank == 'J' || @rank == 'Q' || @rank == 'K'
  end
end
