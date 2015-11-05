require 'hand'

describe "Hand" do
  let(:five_cards) {[
              Card.new(10, :spades),
              Card.new(5, :hearts),
              Card.new(:A, :hearts),
              Card.new(2, :diamonds),
              Card.new(2, :hearts)
            ]}
  subject(:hand) { Hand.new(five_cards) }

  describe "#cards" do
    it "returns an array of five Card objects" do
      expect(hand.cards).to all( be_a(Card) )
    end
  end

  describe "#calculate" do
    it "returns a material value" do
      expect(hand.calculate).to be_an(Integer)
    end
  end

  let(:royal_flush_cards) { [
              Card.new(10, :spades),
              Card.new(:J, :spades),
              Card.new(:A, :spades),
              Card.new(:Q, :spades),
              Card.new(:K, :spades)
            ] }
  let(:royal_flush_hand) { Hand.new(royal_flush_cards) }

  let(:full_house_cards) { [
              Card.new(10, :hearts),
              Card.new(10, :spades),
              Card.new(10, :clubs),
              Card.new(3, :spades),
              Card.new(3, :clubs)
            ] }
  let(:full_house_hand) { Hand.new(full_house_cards) }

  describe "#straight?" do
    it "returns true if the Hand is a straight" do
      expect(royal_flush_hand.straight?).to be true
    end
  end

  describe "#flush?" do
    it "returns true if the Hand is a flush" do
      expect(royal_flush_hand.flush?).to be true
    end
  end

  describe "#royal_flush?" do
    it "returns true if the Hand is a royal flush" do
      expect(royal_flush_hand.royal_flush?).to be true
    end

    it "returns false if the Hand is not royal flush" do
      not_royal_flush_hand = full_house_hand

      expect(not_royal_flush_hand.royal_flush?).to be false
    end
  end
  
  describe "#full_house?" do
    it "returns true if the Hand is a full house" do
      expect(full_house_hand.full_house?).to be true
    end
  end
end
