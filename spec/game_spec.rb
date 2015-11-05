require 'game'

describe "Game (poker)" do
  let(:game) { Game.new(3) }
  describe "#players" do
    it "returns an array of the correct number of Player objects" do
      game.players.each do |player|
        expect(player).to be_kind_of(Player)
      end

      expect(game.players.length).to eq(2)
    end
  end
end
