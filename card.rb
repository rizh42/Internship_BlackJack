class Card
  attr_accessor :rank, :suit, :all_ranks, :all_suits

  def initialize
    all_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    all_suits = ["\u2665", "\u2666", "\u2663", "\u2660"]
    @rank = all_ranks[rand(13)]
    @suit = all_suits[rand(4)]
  end
end