require 'player'

describe "Player" do
  subject(:player) { Player.new(100) }

  describe "#money" do
    it "returns a numerical value of the Player's chip count" do
      expect(player.money).to be_an(Integer)
    end
  end

  describe "#hand" do
    it "returns an empty array when no hand" do
      expect(player.hand).to be_an(Array)
      expect(player.hand).to eq([])
    end
  end

  describe "#receive!" do
    it "adds a card to the player's hand" do
      card = double('card')
      player.receive!(card)

      expect(player.hand).to include(card)
    end
  end

  describe "#discard!" do
    let(:hand) { [:card1, :card2, :card3] }

    it "deletes a card from the player's hand" do
      card_position = 0
      player.discard!(card_position)

      expect(player.hand).not_to include(:card1)
    end
  end
end
