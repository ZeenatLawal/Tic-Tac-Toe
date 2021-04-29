#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength
records = [1,2,3,4,5,6,7,8,9]

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
    raise StandardError, input if input.nil? || !(input.to_i >= 1 && input.to_i < 10) || !records[input.to_i-1].is_a?(Integer) 
  rescue StandardError
    puts 'Invalid move. Please enter a number from 1-9.'
    puts ''
    retry
  end
  records[input.to_i-1] = arg
  system 'cls'
  system 'clear'
  sleep 1
end

game_on = true
count = 0

while game_on && count < 3
  game_start(players[0],board,"X", records)
  game_start(players[1],board, "O", records)
  count += 1
end

board.call
puts "#{players[0]} wins the game."
puts ''
sleep 2
system 'cls'
system 'clear'

count = 0
while game_on && count < 3
  game_start(players[0], board)
  game_start(players[1], board)

  count += 1
end

board.call
puts 'It\'s a Tie.'
puts ''
puts 'Game over.'
sleep 2
system 'cls'
system 'clear'

# rubocop:enable Metrics/MethodLength

puts records