require_relative 'deck'
require_relative 'hand'
require_relative 'player'

class Game
  attr_reader :players

  def initialize(player_count)
    @players = []
  end
end
