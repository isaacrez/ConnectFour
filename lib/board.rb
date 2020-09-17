require './lib/tile'

class Board
  attr_reader :move_count, :content

  def initialize
    @BOARD_SIZE = {x: 7, y: 6}
    @PLAYER_CHARS = ["\u2687", "\u2689"]

    generate_content
    @player_turn = @PLAYER_CHARS[0]
    @move_count = 0
  end

  private
  def generate_content
    @content = []
    1.upto(@BOARD_SIZE[:y]) do
      row = []
      1.upto(@BOARD_SIZE[:x]) do
        row.append Tile.new
      end
      @content.append row
    end
  end

  public
  def play(column)
    for row in @content.reverse do
      if row[column].set_content @player_turn
        @move_count += 1
        switch_turn
        break
      end
    end
  end

  private
  def switch_turn
    idx = @player_turn == @PLAYER_CHARS[0] ? 1 : 0
    @player_turn = @PLAYER_CHARS[idx]
  end

  public
  def display
    for row in @content do
      output = []
      for cell in row do
        output.append cell.content
      end

      puts output.join(" \u2502 ").prepend(' ')
      puts horizontal_divider
    end
    puts grid_label
  end

  private
  def horizontal_divider
    row_count = @BOARD_SIZE[:x]
    ("\u2500\u2500\u2500\u253C" * row_count)[0...-1]
  end

  def grid_label
    (0...@BOARD_SIZE[:x]).to_a.join(' ' * 3).prepend(' ')
  end
end