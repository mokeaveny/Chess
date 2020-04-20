require_relative "./piece.rb"

class Rook < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
		@possible_moves = []
		@alphabet = super
	end

	def display
		"[R]"
	end

	def determine_moves(position, current_board)
		letter = position[0]
		letter_index = @alphabet.index(letter)
		number = position[1]
		number = number.to_i
		
		if number != 8 # If it's at the top of the board then you can't have any moves above
			for i in (number + 1)..8
				coordinate = "#{letter}#{i}"
				coordinate = coordinate.to_sym
				current_piece = current_board.get_piece(coordinate)
				
				if current_piece.colour == @colour # If the current piece on the board is the same colour then it blocks some possible moves
					break					
					
				elsif current_piece.colour == nil # If it's a blank space then it's a possible space
					@possible_moves.append("#{letter}#{i}")

				else
					@possible_moves.append("#{letter}#{i}")
					break

				end
				
			end
		end

		if number != 1 # If it's at the bottom of the board then you can't have any moves down
			for i in (number - 1).downto(1) # Descending loop
				coordinate = "#{letter}#{i}"
				coordinate = coordinate.to_sym
				current_piece = current_board.get_piece(coordinate)
				
				if current_piece.colour == @colour # If the current piece on the board is the same colour then it blocks some possible moves
					break					
					
				elsif current_piece.colour == nil # If it's a blank space then it's a possible space
					@possible_moves.append("#{letter}#{i}")

				else
					@possible_moves.append("#{letter}#{i}")
					break

				end
			end
		end
		puts @possible_moves
		if letter != "h"
			
	end

end