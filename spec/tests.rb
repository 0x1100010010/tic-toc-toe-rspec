
require_relative '../lib/game_logic'
require_relative '../lib/player'
require 'colorize'
require 'rspec'

describe Player do
  player = Player.new('playerName', 'X')
  describe '[Player Class] >>'.bold.blue do
    it 'Check player initialization name.' do
      expect(player.name).to eql('playerName')
    end
    it 'Check player initialization symbol.' do
      expect(player.symbol).to eql('X')
    end
  end
end
