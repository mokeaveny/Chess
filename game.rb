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
		@enemy_king = @black_king
	end

	def change_player
		if @current_player == @player1
			@current_player = @player2
			@current_player_name = "Player 2"
			@enemy_king = @white_king
		else
			@current_player = @player1
			@current_player_name = "Player1"
			@enemy_king = @black_king
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
				if current_piece.is_a?(King) # If the current piece is a king then update the objects position
					current_piece.position = target
				end
				if current_piece.is_a?(Pawn) # Condition in case it's the first move the pawn has made and therefore it's set to false
					current_piece.start = false
				end
				return true
			else
				puts "That is not a valid move for this piece!"
			end

		end
	end

	def king_in_check(current_board, checkmate = false)
		king_moves = @enemy_king.determine_moves(@enemy_king.position, current_board) # Gets the possible_moves of the enemy_king
		friendly_moves = [] # The most recent moved colour's possible moves
		check_moves = [] # The possible moves the most recent placed piece has affected the king with
		current_board.board.each do |(position, piece)|
			if piece.colour == @current_player.colour
				piece_moves = piece.determine_moves(position, current_board)
				piece_moves.each do |move| # Put all of the possible moves of the friendly team into a 1D array
					friendly_moves.append(move)
				end
			end
		end

		friendly_moves.each do |move| # Iterates over all the moves the current player can make
			if move == @enemy_king.position # If any of the moves are the position of the enemy king then they are in check
				check_moves.append(move)
			elsif king_moves.include?(move)
				king_moves.delete(move)
			end
		end

		if check_moves != [] # Check is true
			if king_moves != [] #Check if the king can make any moves. If the king can make a move then not in checkmate
				return "CHECK"
			elsif checkmate == false
				puts check_mate(current_board)
			end 			
		else return "SAFE"
		end
	end

	def check_mate(current_board)
		current_board.board.each do |(position, piece)| # Iterates over the board and selects every enemy piece
			if piece.colour != @current_player.colour && piece.colour != nil
				if piece.is_a?(King)
					next
				else
					current_piece_moves = piece.determine_moves(position, current_board) # Gets all of the current enemy piece's possible positions
					current_piece_moves.each do |move| # For each move the current piece can make
				  	duplicate_board = current_board.dup # Duplicate the current board so that I can make every enemy piece placement and call check on it to see if the king is still in check
			 			duplicate_board.place_piece(position, move, piece) # Place the piece on the board
						current_board.display_board
						duplicate_board.display_board
						is_checkmate = king_in_check(duplicate_board, checkmate = true)# Pass in the changed board and see what it returns
						# Place each piece in each possible location and check whether the king is in check. If the king isn't in check then check_mate is false
						if is_checkmate == "SAFE"
							return false
						end
					end
				end
			end
		end
		return true # If all of the pieces moved still results in check then return true
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
							valid_choice = true
						end
					else
						puts "You have selected a coordinate on the board that isn't your piece or it's blank!"
					end
				else
					puts "That isn't a valid position on the board! Try again!"
				end
			end
			puts king_in_check(@board)
			change_player
		end
	end


end

new_game = Game.new
new_game.play