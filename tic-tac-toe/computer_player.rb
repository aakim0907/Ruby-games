class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name = "Alex")
    @name = name
    @mark = :X
  end

  def get_move
    @board.empty_positions.each do |pos|
      return pos if @board.winning_move?(pos, @mark)
    end
    @board.empty_positions.sample
  end

  def display(board)
    @board = board
    board.display_board
  end

end
