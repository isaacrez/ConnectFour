require './lib/board'
require './lib/win_checker'

class Game
  def initialize
    @board = Board.new
    @board.display
    run
  end

  def run
    win_checker = WinCheck.new
    loop do
      print "Select a column:\t"
      col = get_column
      puts

      @board.play col
      @board.display

      winner = win_checker.get_winner @board.content
      unless winner.nil?
        puts "Congratulations, #{winner} wins!"
        break
      end
    end
  end

  def get_column
    loop do
      input = gets.chomp
      return input.to_i if validate_input input
    end
  end

  def validate_input(input)
    '0' <= input && input < '7'
  end
end

Game.new
