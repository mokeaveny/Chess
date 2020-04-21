class Piece
	attr_reader :colour # Allows the colour of the piece to be accessed from all of the 
	def initialize(position, colour)
		@colour = colour
		@current_position = position
		@alphabet = ["a", "b", "c", "d", "e", "f", "g", "h"] # Only need up from a to h
	end
		
end