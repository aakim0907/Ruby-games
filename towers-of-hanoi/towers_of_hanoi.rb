class TowersOfHanoi
  attr_accessor :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
    @turn = 0
  end

  def play_game
    puts "> WELCOME! LET'S PLAY <TOWERS OF HANOI>!"
    play_turn until won?
    puts "> Congratulations! You finished the game in #{@turn} turns."
  end

  private

  def won?
    @towers[1] == [3, 2, 1] || @towers[2] == [3, 2, 1]
  end

  def play_turn
    render
    moves = get_move
    if valid_move?(moves)
      move_disc(moves)
      @turn += 1
    else
      puts "> Oops, that's an invalid move! Please try again."
    end
  end

  def render
    puts "-----"
    idx = 2
    until idx < 0
      line = []
      3.times do |tower|
        disc = @towers[tower][idx]
        line << (disc ? disc : " ")
      end
      puts line.join(" ")
      idx -= 1
    end
    puts ["-", "-", "-"].join(" ")
    puts [1, 2, 3].join(" ")
  end

  def get_move
    puts "> Select a tower to remove the disc."
    from = gets.chomp
    puts "> Select a tower to move the disc to."
    to = gets.chomp
    [from, to].map(&:to_i).map { |el| el - 1 }
  end

  def valid_move?(moves)
    from, to = moves
    return false if @towers[from].empty?
    @towers[to].empty? || @towers[from].last < @towers[to].last
  end

  def move_disc(moves)
    from, to = moves
    @towers[to] << @towers[from].pop
  end
end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play_game
end
