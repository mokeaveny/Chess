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
			print "#{@current_player_name} Select a piece by inputting the coordinates of the piece: "
			coordinates = gets.chomp # Selects the piece they want to move
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