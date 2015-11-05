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
    generate_card_values
    generate_frequency_hash
  end

  def generate_card_values
    @card_values = @cards.map { |card| TRUE_VALUES[card.value] }
  end

  def generate_frequency_hash
    @card_frequency = Hash.new(0)
    @cards.each { |card| @card_frequency[card.value] += 1 }
  end

  def calculate

  end

  def royal_flush?
    straight_flush? &&
      @card_values.include?(TRUE_VALUES[:A]) &&
      @card_values.include?(TRUE_VALUES[:K])
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    @card_frequency.any? { |card, freq| freq == 4 }
  end

  def full_house?
    three_of_a_kind? && one_pair?
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
    unique_hand_values = sorted_values.uniq
    wanted_card_range = (sorted_values.first..sorted_values.last).to_a

    unique_hand_values == wanted_card_range ||
      unique_hand_values == [2, 3, 4, 5, 14]
  end

  def three_of_a_kind?
    @card_frequency.any? { |card, freq| freq == 3 }
  end

  def two_pair?
    pairs = @card_frequency.select { |card, freq| freq == 2 }
    pairs.length == 2
  end

  def one_pair?
    pairs = @card_frequency.select { |card, freq| freq == 2 }
    pairs.length == 1
  end
end
