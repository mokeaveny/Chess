class Piece
	attr_reader :colour # Allows the colour of the piece to be accessed from all of the 
	def initialize(position, colour)
		@colour = colour
		@current_position = position	
		@valid_moves = [] # Will be used in a method to check whether the possible moves land on a piece of the same colour
		@alphabet = ["a", "b", "c", "d", "e", "f", "g", "h"] # Only need up from a to h
	end
	
	def valid_move?(target) # This method is inherited by all pieces so that it can check all the possible moves to see whether they can be made
	end

		
end