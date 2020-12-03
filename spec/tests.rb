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

describe Game do
  player1 = Player.new('firstPlayer', 'X')
  player2 = Player.new('secondPlayer', 'O')
  game = Game.new(player1, player2)
  describe '[Check player input] >>'.bold.blue do
    it 'Check given input is valid?' do
      expect(game.player_moves?(player1, 'a1')).to eql(true)
    end

    it 'Check invalid input is allowed?' do
      expect(game.player_moves?(player1, 'aa')).to eql(false)
    end

    it 'Check given repetition input is allowed?' do
      expect(game.player_moves?(player2, 'a1')).to eql(false)
    end

    it 'Check invalid input is allowed?' do
      expect(game.player_moves?(player1, 'aa')).to eql(false)
    end

    it 'Check empty input is allowed?' do
      expect(game.player_moves?(player1, '')).to eql(false)
    end

    it 'Check update board status?' do
      expect(game.data).to eql([['X', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end

    it 'Check wrong move update board status?' do
      game.player_moves?(player1, 'a4')
      expect(game.data).to eql([['X', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end

    it 'Check right move update board status?' do
      game.player_moves?(player2, 'b2')
      expect(game.data).to eql([['X', ' ', ' '], [' ', 'O', ' '], [' ', ' ', ' ']])
    end
  end
end
