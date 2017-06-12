require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :board, :current_player

  def initialize(player_one, player_two)
    @board = Board.new
    @player1 = player_one
    @player2 = player_two
    @current_player = @player1
  end

  def play
    play_turn until @board.over?
    @board.display_board
    if @board.winner
      puts "#{@board.winner} is the winner! Congratulations!"
    else
      puts "It's a tie! Maybe another game?"
    end
  end

  def play_turn
    @current_player.display(@board)
    move = @current_player.get_move
    @board.place_mark(move, @current_player.mark)
    switch_players!
  end

  def switch_players!
    @current_player = (@current_player == @player1 ? @player2 : @player1)
  end
end


if __FILE__ == $PROGRAM_NAME
  p1 = HumanPlayer.new("Kim")
  p2 = ComputerPlayer.new("Park")
  g = Game.new(p1, p2)
  g.play
end
