require_relative "./piece.rb"

class Knight < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
	end

	def display
		"[H]"
	end

end