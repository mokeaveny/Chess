class Piece
	attr_reader :colour # Allows the colour of the piece to be accessed from all of the 
	def initialize(position, colour)
		@colour = colour
		@start_position = position	
		@possible_moves = []
	end
	
	def move(position)
	
	end

	def enemy_square?(move, coord)
	end

	def empty_square?(move, coord)
	end

	def team_square?(move, coord)
	end


end