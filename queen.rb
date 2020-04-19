require_relative "./piece.rb"

class Queen < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
	end

	def display
		"[Q]"
	end
end