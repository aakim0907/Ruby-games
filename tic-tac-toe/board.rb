class Board
  attr_accessor :grid

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, mark)
    x, y = pos
    @grid[x][y] = mark
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos].nil?
  end

  def winner
    [row_winner, col_winner, diag_winner].compact.first
  end

  def over?
    return false if @grid.flatten.all?(&:nil?)
    return true if winner || @grid.flatten.none?(&:nil?)
  end

  def display_board
    puts [" ", 1, 2, 3].join(" ")
    @grid.length.times do |i|
      puts "#{i + 1} #{@grid[i].join(" ")}"
    end
  end

  def empty_positions
    positions = []
    @grid.length.times do |row|
      @grid.length.times do |col|
        pos = [row, col]
        positions << pos if self[pos].nil?
      end
    end
    positions
  end

  def winning_move?(pos, mark)
    place_mark(pos, mark)
    win = winner == mark
    self[pos] = nil
    win
  end

  private

  def get_winner(arr)
    arr.each do |row|
      if row.all? { |el| el == :X } || row.all? { |el| el == :O }
        return row.first
      end
    end
    nil
  end

  def row_winner
    get_winner(@grid)
  end

  def col_winner
    columns = []
    3.times do |i|
      col = []
      @grid.each { |row| col << row[i] }
      columns << col
    end

    get_winner(columns)
  end

  def diag_winner
    left, right = [], []
    3.times do |i|
      left << self[[i, i]]
      right << self[[i, 2 - i]]
    end
    diags = [left, right]
    get_winner(diags)
  end
end
