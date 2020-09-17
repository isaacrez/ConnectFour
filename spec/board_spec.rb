require './lib/board'

describe Game do
  it "move count updates when played" do
    board = Board.new
    board.play(0)
    expect(board.move_count).to eql(1)
  end
  
end