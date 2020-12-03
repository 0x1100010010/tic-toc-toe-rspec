#!/usr/bin/ruby
require_relative '../lib/player'
require_relative '../lib/game_logic'

def player_name(order)
  puts "Please introduce #{order} player's name:"

  name = gets.chomp
  if name == '' || name.split('').all?(' ') || !(name.split('').select { |x| x[/\d+/] }).length.zero?
    puts 'Enter a Valid Name'
    name = player_name(order)
  end
  name
end

def start_game
  @player1 = Player.new(player_name('first'), 'X')
  @player2 = Player.new(player_name('second'), 'O')
  if @player1.name == @player2.name
    puts 'Both names can not be the same'
    start_game
  end
  @round = 0
  @game = Game.new(@player1, @player2)
  print_board
  main_loop
end

def main_loop
  player = @player1
  while @round < 9
    if @game.player_moves?(player, player_move(player))
      player = prepare_next_move(player)
    else
      player_wrong_move
    end
  end
  this_is_a_draw
end

def prepare_next_move(player)
  @round += 1
  print_board
  player == @player1 ? @player2 : @player1
end

def print_board(data = nil)
  puts '  1 2 3', '--------'
  i = 0
  arr = %w[a b c]
  newdata = data.nil? ? @game.data : data
  newdata.each do |line|
    text = "#{arr[i]}|#{line.join('|')}|"
    puts text, '--------'
    i += 1
  end
  ' '
end

def player_move(player)
  puts 'Expected Moves [a1-a3] or [b1-b3] or [c1-c3]'
  puts "Turn of #{player.name}"
  gets.chomp
end

def player_wrong_move
  print_board
  puts 'Wrong move!'
end

def player_won(player, data)
  print_board(data)
  abort("Congratulations #{player.name}, you won the Game!")
end

def this_is_a_draw
  abort('This is a draw')
end

puts 'Welcome to tic-tac-toe!'
start_game
