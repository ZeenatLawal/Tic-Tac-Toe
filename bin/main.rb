#!/usr/bin/env ruby
puts 'Welcome to Ruby\'s Tic Tac Toe!'


def get_players_info
    begin
        puts 'Enter Player 1 name: '
        player1 = gets.chomp
        puts ""
        raise StandardError.new(player1) if player1.length < 3 
    
    rescue StandardError => player
        puts "Invalid name \"#{player}\". The name should have at least 3 characters."
        puts ""
        retry
    end
    
    begin
        puts 'Enter Player 2 name: '
        player2 = gets.chomp
        puts ""
        raise StandardError.new(player2) if player2.length < 3 
    
    rescue StandardError => player
        puts "Invalid name \"#{player}\". The name should have at least 3 characters."
        puts ""
        retry
    end

    puts "#{player1.capitalize} will play with X and #{player2.capitalize} will play with O."
    sleep 2
    puts ""
    puts 'Let\'s start!'
    puts ""
    sleep 2
    puts `clear`
    return [player1, player2]
end
