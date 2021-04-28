#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength
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

board = Proc.new do 
    puts '+---+---+---+'
    puts '| 1 | 2 | 3 |'
    puts '+---+---+---+'
    puts '| 4 | 5 | 6 |'
    puts '+---+---+---+'
    puts '| 7 | 8 | 9 |'
    puts '+---+---+---+'
end

def game_start(player, board)
  board.call()
  puts ''
  puts "It's #{player}'s turn!"
  puts ''
  begin
    puts 'Please select an available cell from the board: '
    input = gets.chomp
    puts ''
    raise StandardError, input if input.nil? || !(input.to_i >= 1 && input.to_i < 10)
  rescue StandardError
    puts 'Invalid move. Please enter a number from 1-9.'
    puts ''
    retry
  end
  system 'cls'
  system 'clear'
  sleep 1
end

game_on = true
count = 0

while game_on && count < 3
  game_start(players[0], board)
  game_start(players[1], board)

  count += 1
end

board.call()
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

board.call()  
puts 'It\'s a Tie.'
puts ''
puts 'Game over.'
sleep 2
system 'cls'
system 'clear'

# rubocop:enable Metrics/MethodLength
