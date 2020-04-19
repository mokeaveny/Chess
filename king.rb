require_relative "./piece.rb"

class King < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
	end

	def display
		"[K]"
	end

end