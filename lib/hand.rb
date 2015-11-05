require 'card'

class Hand
  attr_reader :cards

  TRUE_VALUES = {
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,
    10 => 10,
    :J => 11,
    :Q => 12,
    :K => 13,
    :A => 14
  }

  def initialize(cards)
    @cards = cards
    @card_values = @cards.map { |card| TRUE_VALUES[card.value] }
  end

  def calculate

  end

  def royal_flush?
    return false unless straight_flush?
    @card_values.include?(TRUE_VALUES[:A]) &&
      @card_values.include?(TRUE_VALUES[:K])
  end

  def straight_flush?
    return false unless flush? && straight?
    true
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush?
    suit = @cards.first.suit

    @cards[1..4].each do |card|
      return false unless card.suit == suit
    end
    true
  end

  def straight?
    sorted_values = @card_values.sort
    wanted_card_range = (sorted_values.first..sorted_values.last).to_a
    sorted_values.uniq == wanted_card_range
  end

  def three_of_a_kind?
  end

  def two_pairs?
  end

  def one_pair?
  end
end
