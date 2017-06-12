class HumanPlayer
  attr_reader :name
  attr_accessor :mark

  def initialize(name = "Carrie")
    @name = name
    @mark = :O
  end

  def get_move
    puts ">Where would you like to make a move? (e.g. 2,1 for row,col)"
    move = gets.chomp
    pos = move.split(",").map(&:to_i)
    raise ">That's an invalid move! Try again!" unless valid_move?(pos)
    rescue
      retry
  end

  def display(board)
    board.display_board
  end

  private

  def valid_move?(pos)
    return false unless pos.length == 2
    pos.all? { |el| el.between?(0..2) }
  end

end
