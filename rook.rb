require_relative "./piece.rb"

class Rook < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
	end

	def display
		"[R]"
	end

end