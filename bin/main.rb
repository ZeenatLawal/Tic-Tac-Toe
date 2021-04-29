#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength
require './lib/logic'
require './lib/draw'
records = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def players_info
  puts 'Welcome to Ruby\'s Tic Tac Toe!'
  begin
    puts 'Enter Player 1 name: '
    player1 = gets.chomp.capitalize
    puts ''
    raise StandardError, player1 if player1.length < 3
  rescue StandardError => e
    puts "Invalid name \"#{e}\". The name should have at least 3 characters."
    puts ''
    retry
  end

  begin
    puts 'Enter Player 2 name: '
    player2 = gets.chomp.capitalize
    puts ''
    raise StandardError, player2 if player2.length < 3
  rescue StandardError => e
    puts "Invalid name \"#{e}\". The name should have at least 3 characters."
    puts ''
    retry
  end

  puts "#{player1} will play with X and #{player2} will play with O."
  sleep 2
  puts ''
  puts 'Let\'s start!'
  puts ''
  sleep 2
  system 'cls'
  system 'clear'
  [player1, player2]
end
players = players_info

board = proc do
  puts '+---+---+---+'
  puts "| #{records[0]} | #{records[1]} | #{records[2]} |"
  puts '+---+---+---+'
  puts "| #{records[3]} | #{records[4]} | #{records[5]} |"
  puts '+---+---+---+'
  puts "| #{records[6]} | #{records[7]} | #{records[8]} |"
  puts '+---+---+---+'
end

def game_start(player, board, arg, records)
  board.call
  puts ''
  puts "It's #{player}'s turn!"
  puts ''
  begin
    puts 'Please select an available cell from the board: '
    input = gets.chomp
    puts ''
    if input.nil? || !(input.to_i >= 1 && input.to_i < 10) || !records[input.to_i - 1].is_a?(Integer)
      raise StandardError,
            input
    end
  rescue StandardError
    puts 'Invalid move. Please enter a number from 1-9.'
    puts ''
    retry
  end
  records[input.to_i - 1] = arg
  system 'cls'
  system 'clear'
  sleep 1
end

def play(players, board, records)
  game_on = true

  while game_on
    game_start(players[0], board, 'X', records)
    logic = Logic.new(records)
    draw = Draw.new(records)

    if logic.winner?('X')
      puts "#{players[0]} wins the game!"
      sleep 2
      game_on = false
      return
    elsif draw.draw?
      puts 'It\'s a Tie!'
      puts ''
      puts 'Game Over'
      sleep 2
      game_on = false
      return
    end
    game_start(players[1], board, 'O', records)
    logic = Logic.new(records)
    draw = Draw.new(records)

    if logic.winner?('O')
      puts "#{players[1]} wins the game!"
      sleep 2
      game_on = false
      return
    elsif draw.draw?
      puts 'It\'s a Tie!'
      puts ''
      puts 'Game Over'
      sleep 2
      game_on = false
      return
    end
  end
end

play(players, board, records)

# rubocop:enable Metrics/MethodLength
