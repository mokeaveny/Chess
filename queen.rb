require_relative "./piece.rb"

class Queen < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
		@possible_moves = []
		@alphabet = super
	end

	def display
		if @colour == "B"
			"[♕]"
		elsif @colour == "W"
			"[♛]"
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
		upper_left = false # Used in the loops when they turn 
		upper_right = false
		lower_left = false
		lower_right = false

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

		#Determines lower_left
		ll_number = number # Counter that stores the current number
		ll_letter = letter # Counter that stores the current letter
		ll_letter_index = letter_index
		while lower_left == false
			if ll_number == 1
				lower_left = true
			
			elsif ll_letter == "a" # Furthest right letter is h
				lower_left = true
			
			else
				ll_number -= 1
				ll_letter_index -= 1 # The letters move down the alphabet
				ll_letter = @alphabet[ll_letter_index]
				coordinate = "#{ll_letter}#{ll_number}"
				coordinate = coordinate.to_sym
				current_piece = current_board.get_piece(coordinate)
				
				if current_piece.colour == @colour
					lower_left = true
				
				elsif current_piece.colour == nil
					@possible_moves.append("#{ll_letter}#{ll_number}")
				
				else
					@possible_moves.append("#{ll_letter}#{ll_number}")
					lower_left = true
				end
			end
		end

		#Determines lower_left
		lr_number = number # Counter that stores the current number
		lr_letter = letter # Counter that stores the current letter
		lr_letter_index = letter_index
		while lower_right == false
			if lr_number == 1
				lower_right = true
			
			elsif lr_letter == "h" # Furthest right letter is h
				lower_right = true
			
			else
				lr_number -= 1
				lr_letter_index += 1 # The letters move up the alphabet
				lr_letter = @alphabet[lr_letter_index]
				coordinate = "#{lr_letter}#{lr_number}"
				coordinate = coordinate.to_sym
				current_piece = current_board.get_piece(coordinate)
				
				if current_piece.colour == @colour
					lower_right = true
				
				elsif current_piece.colour == nil
					@possible_moves.append("#{lr_letter}#{lr_number}")
				
				else
					@possible_moves.append("#{lr_letter}#{lr_number}")
					lower_right = true
				end
			end
		end
		
	return @possible_moves
	end

end