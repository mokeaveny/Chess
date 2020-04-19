class Piece
	attr_reader :colour # Allows the colour of the piece to be accessed from all of the 
	def initialize(position, colour)
		@colour = colour
		@current_position = position	
		@possible_moves = []
	end
	
	def move(start, target)
		initial_pos = @current_position 
	end

end