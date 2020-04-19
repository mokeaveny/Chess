require_relative "./piece.rb"

class Pawn < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
		@start = true  # Allows one of the possible moves to be forwards 2 as well as forwards 1
		@possible_moves = []
		@alphabet = super # Gets the alphabet array from the parent class
	end

	def display
		"[P]"
	end

	def determine_moves(position, current_board)
		letter = position[0]
		the_number = position[1]		
		the_number = the_number.to_i # Convert it to an integer so that we can increment it

		if @colour == "W" # The coordinates can only decrease by a number, not increase
			number = the_number - 1
			@possible_moves.append("#{letter}#{number}")
			
			if @start == true # Checks if it's still in its starting position
				number = the_number - 2
				@possible_moves.append("#{letter}#{number}")
				@start = false
			end

		if letter == "a" # If the letter is a then it will check whether the bottom right coordinate is a black piece
			number = the_number - 1
			new_letter = @alphabet[1]
			coordinate = "#{new_letter}#{number}"	
			compare_piece = current_board.get_piece(coordinate)
			
			if compare_piece.colour == "B" # If it is a black piece then it is a valid move
				@possible_moves.append(coordinate)
			end


		elsif letter == "h"
			number = the_number - 1
			new_letter = @alphabet[6]
			coordinate = "#{new_letter}#{number}"	
			compare_piece = current_board.get_piece(coordinate) 
			
			if compare_piece.colour == "B"
				@possible_moves.append(coordinate)
			end

		else
			number = the_number - 1 
			letter_index = @alphabet.index(letter) # Finds the index of the current letter to be used to check for black pieces
			new_letter1 = @alphabet[letter_index - 1]
			new_letter2 = @alphabet[letter_index + 1]
			coordinate1 = "#{new_letter1}#{number}"
			coordinate2 = "#{new_letter2}#{number}"
			compare_piece1 = current_board.get_piece(coordinate1)
			compare_piece2 = current_board.get_piece(coordinate2)

			if compare_piece1.colour == "B"
				@possible_moves.append(coordinate1)
			end

			if compare_piece2.colour == "B"
				@possible_moves.append(coordinate2)
			end
		end
		
			
		puts @possible_moves

		elsif @colour == "B"
			number = the_number + 1
			@possible_moves.append("#{letter}#{number}")
			puts @possible_moves
			
			if @start == true # Checks if it's still in its starting position
				number = the_number + 2
				@possible_moves.append("#{letter}#{number}")
				puts @possible_moves
				@start = false
			end
			

		end	
			
		
	end
		

		
end
