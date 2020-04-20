require_relative "./piece.rb"

class King < Piece
	def initialize(position, colour)
		@colour = colour
		@position = position
		@possible_moves = []
		@alphabet = super
	end

	def display
		"[K]"
	end


	# The kings possible moves are a cube, therefore check them all and eliminate those that are out of bounds
	def determine_moves(position, current_board)
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