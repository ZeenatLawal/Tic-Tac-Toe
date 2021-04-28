#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength
cells = ["","1","2","3","4","5","6","7","8","9"]
records = ["","","","","","","","",""]

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
  puts `clear`
  [player1, player2]
end
players = players_info

def game_start(player, cells, arg, records)
  puts '+---+---+---+'
  puts "| #{cells[1]} | #{cells[2]} | #{cells[3]} |"
  puts '+---+---+---+'
  puts "| #{cells[4]} | #{cells[5]} | #{cells[6]} |"
  puts '+---+---+---+'
  puts "| #{cells[7]} | #{cells[8]} | #{cells[9]} |"
  puts '+---+---+---+'
  puts ''
  puts "It's #{player}'s turn!"
  puts ''
  begin
    puts 'Please select an available cell from the board: '
    input = gets.chomp
    puts ''
    raise StandardError, input if input.nil? || !(input.to_i >= 1 && input.to_i < 10) || records[input.to_i-1].length > 0 
  rescue StandardError
    puts 'Invalid move. Please enter a number from 1-9.'
    puts ''
    retry
  end
  cells[input.to_i] = arg
  records[input.to_i-1] = arg
  puts `clear`
  sleep 1
end

2.times do
  game_start(players[0], cells, "X", records)
  game_start(players[1], cells, "O", records)
end

puts "#{players[0]} wins the game."
puts ''
puts 'Game over.'
sleep 2
puts `clear`

# rubocop:enable Metrics/MethodLength
