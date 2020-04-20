require_relative "./piece.rb"

class Bishop < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
		@possible_moves = []
		@alphabet = super
	end

	def display
		"[B]"
	end

	def determine_moves(position, current_board)
		letter = position[0]
		letter_index = @alphabet.index(letter)
		number = position[1]
		number = number.to_i
		upper_left = false # Used in the loops when they turn 
		upper_right = false
		lower_left = false
		lower_right = false

		#Determines upper_left
		ul_number = number # Counter that stores the current number
		ul_letter = letter # Counter that stores the current letter
		ul_letter_index = letter_index
		while upper_left == false
			if ul_number == 8
				upper_left = true
			
			elsif ul_letter == "a"
				upper_left = true
			
			else
				ul_number += 1
				ul_letter_index -= 1
				ul_letter = @alphabet[ul_letter_index]
				coordinate = "#{ul_letter}#{ul_number}"
				coordinate = coordinate.to_sym
				current_piece = current_board.get_piece(coordinate)
				
				if current_piece.colour == @colour
					upper_left = true
				
				elsif current_piece.colour == nil
					@possible_moves.append("#{ul_letter}#{ul_number}")
				
				else
					@possible_moves.append("#{ul_letter}#{ul_number}")
					upper_left = true
				end
			end
		end

		#Determines upper_right
		ur_number = number # Counter that stores the current number
		ur_letter = letter # Counter that stores the current letter
		ur_letter_index = letter_index
		while upper_right == false
			if ur_number == 8
				upper_right = true
			
			elsif ur_letter == "h" # Furthest right letter is h
				upper_right = true
			
			else
				ur_number += 1
				ur_letter_index += 1 # The letters move up the alphabet
				ur_letter = @alphabet[ur_letter_index]
				coordinate = "#{ur_letter}#{ur_number}"
				coordinate = coordinate.to_sym
				current_piece = current_board.get_piece(coordinate)
				
				if current_piece.colour == @colour
					upper_right = true
				
				elsif current_piece.colour == nil
					@possible_moves.append("#{ur_letter}#{ur_number}")
				
				else
					@possible_moves.append("#{ur_letter}#{ur_number}")
					upper_right = true
				end
			end
		end
		
	
	puts @possible_moves
	end

		

end
