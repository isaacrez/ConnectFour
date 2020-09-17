class WinCheck

  def get_winner(board)
    @board = board
    extract_board_size
    return horizontal_win || vertical_win
  end

  private
  def extract_board_size
    @size = {
      x: @board.size,
      y: @board.first.size
    }
  end

  private
  def vertical_win
    0.upto(@size[:y] - 1) do |y|
      reset
      0.upto(@size[:x] - 1) do |x|
        @cell = @board[x][y]
        update_counter
        return @marker if @counter == 4
      end
    end
    return nil
  end

  private
  def horizontal_win
    0.upto(@size[:x] - 1) do |x|
      reset
      0.upto(@size[:y] - 1) do |y|
        @cell = @board[x][y]
        update_counter
        return @marker if @counter == 4
      end
    end
    return nil
  end

  private
  def reset
    @marker = nil
    @counter = 0
  end

  private
  def update_counter
    if @marker.to_s == @cell.content
      @counter += 1
    else
      @marker = @cell.content unless @cell.content == @cell.DEFAULT
      @counter = 1
    end
  end
end
