require './lib/board'

describe Board do
  it "increments move counter" do
    board = Board.new
    board.play(0)
    expect(board.move_count).to eql(1)
  end

  it "can place a piece" do
    board = Board.new
    board.play(0)
    played_cell = board.content[5][0]
    expect(played_cell.content).not_to eql(played_cell.DEFAULT)
  end

  it "switches turns" do
    board = Board.new
    board.play(0)
    player_one = board.content[5][0]
    board.play(0)
    player_two = board.content[4][0]
    expect(player_one.content).not_to eql(player_two.content)
  end
end
