require_relative "./piece.rb"

class Knight < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
		@possible_moves = []
		@alphabet = super
	end

	def display
		if @colour == "B"
			"[♘]"
		elsif @colour == "W"
			"[♞]"
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

	# Determine all the possible moves first, then remove those that aren't possible. A horse can jump so
	# no piece can block it apart from that of the same colour in the position it wants to go to

		if check_letter_pos(letter_index, -1) == true && check_number_pos(number, -2) == true
			lower_left = "#{@alphabet[letter_index - 1]}#{number - 2}"
			@possible_moves.append(lower_left)
		end

		if check_letter_pos(letter_index, -1) == true && check_number_pos(number, 2) == true			
			upper_left = "#{@alphabet[letter_index - 1]}#{number + 2}"
			@possible_moves.append(upper_left)
		end

		if check_letter_pos(letter_index, -2) == true && check_number_pos(number, -1) == true			
			lower_leftmost = "#{@alphabet[letter_index - 2]}#{number - 1}"
			@possible_moves.append(lower_leftmost)
		end

		if check_letter_pos(letter_index, -2) == true && check_number_pos(number, 1) == true			
			upper_leftmost = "#{@alphabet[letter_index - 2]}#{number + 1}"
			@possible_moves.append(upper_leftmost)
		end	

		if check_letter_pos(letter_index, 1) == true && check_number_pos(number, -2) == true			
			lower_right = "#{@alphabet[letter_index + 1]}#{number - 2}"
			@possible_moves.append(lower_right)
		end	

		if check_letter_pos(letter_index, 1) == true && check_number_pos(number, 2) == true			
			upper_right = "#{@alphabet[letter_index + 1]}#{number + 2}"
			@possible_moves.append(upper_right)
		end

		if check_letter_pos(letter_index, 2) == true && check_number_pos(number, -1) == true			
			lower_rightmost = "#{@alphabet[letter_index + 2]}#{number - 1}"
			@possible_moves.append(lower_rightmost)
		end
		
		if check_letter_pos(letter_index, 2) == true && check_number_pos(number, 1) == true			
			upper_rightmost = "#{@alphabet[letter_index + 2]}#{number + 1}"
			@possible_moves.append(upper_rightmost)
		end

		#Iterates over every possible move, if the move is of the same colour as the current piece then remove it as a possible move
		number_of_moves = @possible_moves.length
		counter = 0
		while counter < number_of_moves
			move = @possible_moves[counter]
			move = move.to_sym # Convert to a symbol as it's stored as a symbol in the hash
			current_piece = current_board.get_piece(move)
			
			if current_piece.colour == @colour
				move = move.to_s # Convert to string as it's stored as a string in the array
				@possible_moves.delete(move) # Fix this, got an error
				number_of_moves -= 1
			else
				counter += 1
			end
		end
	
	return @possible_moves

	end

	def check_letter_pos(position, move)
		
		new_letter_index = position + move
		new_letter = @alphabet[new_letter_index]

		if new_letter == nil || new_letter_index < 0 # Eliminates negative indexing
			return false

		else
			return true
		
		end
	end


	def check_number_pos(position, move)

		new_number_index = position + move

		if (new_number_index < 1) || (new_number_index > 8)
			return false

		else
			return true

		end
	end 

end