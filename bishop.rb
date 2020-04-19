require_relative "./bishop.rb"

class Bishop < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
	end

	def display
		"[B]"
	end

end
