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