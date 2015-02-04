#!/usr/bin/env ruby
################################################################################
# cube-stats.rb
################################################################################

require "json"
require "rubiks_cube"
require "./scramble.rb"

# usage help
if ARGV.length != 1 && ARGV.length != 2 then
    puts "Usage: cube-stats <iterations> [scramble_moves]"
    puts
    puts "Scramble cube for n interations and record the"
    puts "amount of moves it takes to solve it."
    exit 1
end

# number of iterations to do
iterations = ARGV[0].to_i
abort "error: iterations must be >= 1" if iterations < 1

# moves to scramble each iteration (default 100)
scramble_moves = ARGV[1].to_i != 0 ? ARGV[1].to_i : 100

# create a new cube and a data hash
cube = RubiksCube::Cube.new
data = {
    :iterations => iterations,
    :scramble_moves => scramble_moves,
    :moves => Array.new
}

puts "Running #{iterations} iterations with #{scramble_moves} scramble moves per iteration."

# run the iterations
iterations.times do |i|
    # Scramble cube with 100 moves
    seq = Scramble.get_random_moves(scramble_moves)
    cube.perform! seq

    # How many moves does it take?
    solution = RubiksCube::TwoCycleSolution.new(cube)

    puts "Trial ##{(i+1).to_s.rjust(3, "0")} - #{solution.length} moves"

    data[:moves] << solution.length
end

# dump data to JSON
File.open("cube-stats.json", "w") do |f|
    f.write JSON.pretty_generate(data) + "\n"
end
