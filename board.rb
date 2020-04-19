require_relative "./pawn.rb"
require_relative "./queen.rb"
require_relative "./bishop.rb"

class Board
	attr_accessor :board
	def initialize
		
		blank = Blank.new # Create a blank object. This displays a blank space and has no colour.

		@board = {:a8 => blank, :b8 => Bishop.new("b8", "W"), :c8 => blank, :d8 => Queen.new("d8", "W"), :e8 => blank, :f8 => blank,
						  :g8 => Bishop.new("g8", "W"), :h8 => blank,
							
							:a7 => Pawn.new("a7", "W"),:b7 => Pawn.new("b7", "W"), :c7 => Pawn.new("c7", "W"),
							:d7 => Pawn.new("d7", "W"), :e7 => Pawn.new("e7", "W"), :f7 => Pawn.new("f7", "W"),
							:g7 => Pawn.new("g7", "W"), :h7 => Pawn.new("h7", "W"),

							:a6 => blank, :b6 => blank, :c6 => blank, :d6 => blank, :e6 => blank, :f6 => blank,
						  :g6 => blank, :h6 => blank,

							:a5 => blank, :b5 => blank, :c5 => blank, :d5 => blank, :e5 => blank, :f5 => blank,
						  :g5 => blank, :h5 => blank,

							:a4 => blank, :b4 => blank, :c4 => blank, :d4 => blank, :e4 => blank, :f4 => blank,
						  :g4 => blank, :h4 => blank,

							:a3 => blank, :b3 => blank, :c3 => blank, :d3 => blank, :e3 => blank, :f3 => blank,
						  :g3 => blank, :h3 => blank,

							:a2 => Pawn.new("a2", "B"), :b2 => Pawn.new("b2", "B"), :c2 => Pawn.new("c2", "B"), 
							:d2 => Pawn.new("d2", "B"), :e2 => Pawn.new("e2", "B"), :f2 => Pawn.new("f2", "B"),
						  :g2 => Pawn.new("g2", "B"), :h2 => Pawn.new("h2", "B"),						

							:a1 => blank, :b1 => Bishop.new("b1", "B"), :c1 => blank, :d1 => Queen.new("d1", "B"), :e1 => blank, :f1 => blank,
						  :g1 => Bishop.new("g1", "B"), :h1 => blank,
						}			

	end

	def display_board
		print "8 #{board[:a8].display}#{board[:b8].display}#{board[:c8].display}#{board[:d8].display}"
		print "#{board[:e8].display}#{board[:f8].display}#{board[:g8].display}#{board[:h8].display}"
		puts # Display a blank line

		print "7 #{board[:a7].display}#{board[:b7].display}#{board[:c7].display}#{board[:d7].display}"
		print "#{board[:e7].display}#{board[:f7].display}#{board[:g7].display}#{board[:h7].display}"
		puts # Display a blank line

		print "6 #{board[:a6].display}#{board[:b6].display}#{board[:c6].display}#{board[:d6].display}"
		print "#{board[:e6].display}#{board[:f6].display}#{board[:g6].display}#{board[:h6].display}"
		puts

		print "5 #{board[:a5].display}#{board[:b5].display}#{board[:c5].display}#{board[:d5].display}"
		print "#{board[:e5].display}#{board[:f5].display}#{board[:g5].display}#{board[:h5].display}"
		puts

		print "4 #{board[:a4].display}#{board[:b4].display}#{board[:c4].display}#{board[:d4].display}"
		print "#{board[:e4].display}#{board[:f4].display}#{board[:g4].display}#{board[:h4].display}"
		puts

		print "3 #{board[:a3].display}#{board[:b3].display}#{board[:c3].display}#{board[:d3].display}"
		print "#{board[:e3].display}#{board[:f3].display}#{board[:g3].display}#{board[:h3].display}"
		puts

		print "2 #{board[:a2].display}#{board[:b2].display}#{board[:c2].display}#{board[:d2].display}"
		print "#{board[:e2].display}#{board[:f2].display}#{board[:g2].display}#{board[:h2].display}"
		puts

		print "1 #{board[:a1].display}#{board[:b1].display}#{board[:c1].display}#{board[:d1].display}"
		print "#{board[:e1].display}#{board[:f1].display}#{board[:g1].display}#{board[:h1].display}"
		puts

		puts "   a  b  c  d  e  f  g  h"
	end

end

class Blank
	attr_reader :colour
	@colour = nil
	def display
		"[ ]"
	end
end

new_board = Board.new
new_board.display_board