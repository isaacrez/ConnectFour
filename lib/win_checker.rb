class WinCheck

  @@WIN_LENGTH = 4

  def get_winner(board)
    @board = board
    extract_board_size
    return horizontal_win || vertical_win || diagonal_win
  end

  private
  def extract_board_size
    @size = {
      x: @board.first.size,
      y: @board.size
    }
  end

  private
  def vertical_win
    0.upto(@size[:y] - 1) do |y|
      reset
      0.upto(@size[:x] - 1) do |x|
        @cell = @board[y][x]
        update_counter
        return @marker if @counter == @@WIN_LENGTH
      end
    end
    return nil
  end

  private
  def horizontal_win
    0.upto(@size[:x] - 1) do |x|
      reset
      0.upto(@size[:y] - 1) do |y|
        @cell = @board[y][x]
        update_counter
        return @marker if @counter == @@WIN_LENGTH
      end
    end
    return nil
  end

  private
  def diagonal_win
    0.upto(@size[:x] - 1) do |x|
      0.upto(@size[:y] - 1) do |y|
        winner = check_upper_diagonal(x, y) || check_lower_diagonal(x, y)
        return winner unless winner.nil?
      end
    end
    return nil
  end

  def check_upper_diagonal(x, y)
    cell = @board[y][x]
    marker = cell.content

    return nil if marker == cell.DEFAULT

    1.upto(@@WIN_LENGTH - 1) do |i|
      return nil unless in_bounds?(x + i, y + i)
      cell = @board[y + i][x + i]
      return nil unless cell.content == marker 
    end
    return marker
  end

  def check_lower_diagonal(x, y)
    cell = @board[y][x]
    marker = cell.content

    return nil if marker == cell.DEFAULT

    1.upto(@@WIN_LENGTH - 1) do |i|
      return nil unless in_bounds?(x + i, y - i)
      cell = @board[y - i][x + i]
      return nil unless cell.content == marker 
    end
    return marker
  end

  private
  def in_bounds?(x, y)
    (0 <= x && x < @size[:x]) && (0 <= y && y < @size[:y])
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
