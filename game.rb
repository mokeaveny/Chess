require_relative "./board.rb"

class Player
	attr_reader :colour
	def initialize(colour)
		@colour = colour
	end
end

class Game
	def initialize
		@board = Board.new
		@player1 = Player.new("W")
		@player2 = Player.new("B")
		@current_player = @player1
		@current_player_name = "Player 1"
		@won = false
		@valid_letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
		@white_king = @board.get_piece("e8") # Gets the white king object
		@black_king = @board.get_piece("e1") # Gets the black king object
	end

	def change_player
		if @current_player == @player1
			@current_player = @player2
			@current_player_name = "Player 2"
		else
			@current_player = @player1
			@current_player_name = "Player1"
		end
	end

	def move_piece(start)
		move_choice = false
		while move_choice == false
			current_piece = @board.get_piece(start)
			possible_moves = current_piece.determine_moves(start, @board)
			puts possible_moves

			if possible_moves == []
				puts "There are no valid moves for this piece, pick another piece!"
				return false
			end

			puts "Where would you like to move the piece?"
			target = gets.chomp

			if possible_moves.include?(target) # If the user chooses a coordinate that is included within the possible_moves then the piece move is valid
				@board.place_piece(start, target, current_piece) # Moves the piece on the current board
				return true
			else
				puts "That is not a valid move for this piece!"
			end

		end
	end

	def king_check(moved_coordinates)
		enemy_king = nil
		if @current_player == @player1
			enemy_king = @black_king
		
		elsif @current_player == @player2
			enemy_king = @white_king
		end

		piece_to_check = @board.get_piece(moved_coordinates) # Using the moved piece coordinates
																												 # Check if any of the possible moves are the coordinate of the enemy king
		moved_piece_moves = piece_to_check.determine_moves(moved_coordinates, @board)
		
	end

	def play
		while @won == false
			@board.display_board
			puts
			valid_choice = false
			while valid_choice == false
				print "#{@current_player_name} Select a piece by inputting the coordinates of the piece: "
				coordinates = gets.chomp # Selects the piece they want to move
				letter = coordinates[0]
				number = coordinates[1]
				number = number.to_i
				if @valid_letters.include?(letter) == true && (number > 0 && number < 9) == true
					current_piece = @board.get_piece(coordinates)
					if current_piece.colour == @current_player.colour # If the selected piece is the same colour as the current player then it can be moved by them
						if move_piece(coordinates) == true
							#Here is where the king will be checked for						
							valid_choice = true
						end
					else
						puts "You have selected a coordinate on the board that isn't your piece or it's blank!"
					end
				else
						puts "That isn't a valid position on the board! Try again!"
				end
			end
			change_player
		end
	end


end

new_game = Game.new
new_game.play