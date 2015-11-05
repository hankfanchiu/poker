class Player
  attr_reader :hand, :money

  def initialize(chip_count)
    @money = chip_count
    @hand = []
  end

  def receive!(card)
    @hand << card
  end

  def discard!(card_position)
    @hand.delete_at(card_position)
  end
end
