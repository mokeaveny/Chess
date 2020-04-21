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
						valid_choice = true
					else
						puts "You have selected a coordinate on the board that isn't your piece or it's blank!"
					end
				else
						puts "That isn't a valid position on the board! Try again!"
				end
			end
			current_piece = @board.get_piece(coordinates) # Selects the piece they want to move from the board
			puts current_piece.determine_moves(coordinates, @board) # determine_moves is a method shared by all game pieces
			puts "Where would you like to move the piece?"
			target = gets.chomp
			@board.place_piece(coordinates, target, current_piece)
			change_player
		end
	end


end

new_game = Game.new
new_game.play