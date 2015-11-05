require 'card'

describe "Card" do
  subject(:card) { Card.new(:A, :spades) }
  describe "#value" do
    it "returns the value of the card" do
      expect(card.value).to eq(:A)
    end
  end

  describe "#suit" do
    it "returns the suit of card" do
      expect(card.suit).to eq(:spades)
    end
  end
end
