require_relative "./piece.rb"

class Rook < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
		@possible_moves = []
		@alphabet = super
	end

	def display
		if @colour == "B"
			"[♖]"
		elsif @colour == "W"
			"[♜]"	
		end
	end

	def clear_moves
		@possible_moves = []
	end

	def determine_moves(position, current_board)
		clear_moves
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

		if letter != "h"
			for i in (letter_index + 1)..7 # Goes from the letter to the leftmost letter
				new_letter = @alphabet[i]
				coordinate = "#{new_letter}#{number}"
				coordinate = coordinate. to_sym
				current_piece = current_board.get_piece(coordinate)
				
				if current_piece.colour == @colour
					break
				
				elsif current_piece.colour == nil
					@possible_moves.append("#{new_letter}#{number}")
				
				else
					@possible_moves.append("#{new_letter}#{number}")
					break
				end
			end
		end			

		if letter != "a"
			for i in (letter_index - 1).downto(0) # Goes from the letter to the leftmost letter
				new_letter = @alphabet[i]
				coordinate = "#{new_letter}#{number}"
				coordinate = coordinate.to_sym
				current_piece = current_board.get_piece(coordinate)
				
				if current_piece.colour == @colour
					break
				
				elsif current_piece.colour == nil
					@possible_moves.append("#{new_letter}#{number}")
				
				else
					@possible_moves.append("#{new_letter}#{number}")
					break
				end
			end
		end			
	return @possible_moves
	end

end