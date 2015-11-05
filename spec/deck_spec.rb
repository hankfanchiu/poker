require 'deck'

describe "Deck" do
  let(:deck) { Deck.new }
  describe "#cards" do
    it "has 52 unique cards" do
      expect(deck.cards.uniq).to eq(deck.cards)
      expect(deck.cards.count).to be(52)
    end
  end
end
