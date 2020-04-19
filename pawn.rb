require_relative "./piece.rb"

class Pawn < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
	end

	def display
		"[P]"
	end
		
end

test_pawn = Pawn.new("e7", "W")
puts test_pawn.colour