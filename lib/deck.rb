require_relative 'card'

class Deck
  attr_accessor :cards

  VALUES = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:spades, :hearts, :diamonds, :clubs]

  def initialize
    @cards = []
    populate_deck
    shuffle
  end

  def populate_deck
    SUITS.each do |suit|
      VALUES.each { |value| @cards << Card.new(value, suit) }
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end
