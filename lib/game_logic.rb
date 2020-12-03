# Class for game creation
class Game
  require_relative './check_winner'
  include Checker
  attr_reader :data

  def initialize(player1, player2)
    @data = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
    @player1 = player1
    @player2 = player2
  end

  def player_moves?(player, player_input)
    @player_input = player_input
    first = %w[a b c].index(@player_input[0])
    second = [1, 2, 3].index(@player_input[1].to_i)
    if right_move?(first, second)
      move(first, second, player.symbol)
      true
    else
      false
    end
  end

  private

  def right_move?(first, second)
    @player_input.length == 2 && !first.nil? && !second.nil? && @data[first][second] == ' '
  end

  def move(first, second, symbol)
    @data[first][second] = symbol
    result = check_winner(@data)
    player_won(@player1, @data) if result == 1
    player_won(@player2, @data) if result == 2
  end
end
