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
	end

	def play
		@board.display_board
		puts
		print "#{@current_player_name} Select a piece by inputting the coordinates of the piece: "
		coordinates = gets.chomp
		current_piece = @board.get_piece(coordinates)
		puts current_piece.determine_moves(coordinates, @board) # determine_moves is a method shared by all game pieces
		puts "Where would you like to move the piece?"
		target = gets.chomp
		@board.place_piece(target, current_piece)
		@board.display_board
		
	end

end

new_game = Game.new
new_game.play