require_relative "./piece.rb"

class King < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
		@possible_moves = []
		@alphabet = super
	end

	def display
		if @colour == "B"
			"[♔]" # Actually the white unicode character. Looks black in terminal
		elsif @colour == "W"
			"[♚]" # Actually the black unicode character. Looks white in terminal
		end	
	end

	def clear_moves
		@possible_moves = []
	end

	# The kings possible moves are a cube, therefore check them all and eliminate those that are out of bounds
	def determine_moves(position, current_board)
		clear_moves
		letter = position[0]
		letter_index = @alphabet.index(letter)
		number = position[1]
		number = number.to_i

		#top left
		if check_letter_pos(letter_index, -1) == true && check_number_pos(number, 1) == true
			top_left = "#{@alphabet[letter_index - 1]}#{number + 1}"
			@possible_moves.append(top_left)
		end

		#top mid
		if check_letter_pos(letter_index, 0) == true && check_number_pos(number, 1) == true
			top_mid = "#{letter}#{number + 1}"
			@possible_moves.append(top_mid)
		end

		#top right
		if check_letter_pos(letter_index, 1) == true && check_number_pos(number, 1) == true
			top_right = "#{@alphabet[letter_index + 1]}#{number + 1}"
			@possible_moves.append(top_right)
		end

		#mid left
		if check_letter_pos(letter_index, -1) == true && check_number_pos(number, 0) == true
			mid_left = "#{@alphabet[letter_index - 1]}#{number}"
			@possible_moves.append(mid_left)
		end

		#mid right
		if check_letter_pos(letter_index, 1) == true && check_number_pos(number, 0) == true
			mid_right = "#{@alphabet[letter_index + 1]}#{number}"
			@possible_moves.append(mid_right)
		end

		#bottom left
		if check_letter_pos(letter_index, -1) == true && check_number_pos(number, -1) == true
			bottom_left = "#{@alphabet[letter_index - 1]}#{number - 1}"
			@possible_moves.append(bottom_left)
		end

		#bottom mid
		if check_letter_pos(letter_index, 0) == true && check_number_pos(number, -1) == true
			bottom_mid = "#{letter}#{number - 1}"
			@possible_moves.append(bottom_mid)
		end

		#bottom right
		if check_letter_pos(letter_index, 1) == true && check_number_pos(number, -1) == true
			bottom_right = "#{@alphabet[letter_index + 1]}#{number - 1}"
			@possible_moves.append(bottom_right)
		end	
		
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

		if new_letter == nil || new_letter_index < 0
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