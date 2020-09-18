require './lib/board'
require './lib/win_checker'

describe WinCheck do
  WC = WinCheck.new

  it "does not allow DEFAULT to win" do
    board = Board.new
    expect(WC.get_winner board.content).to eql(nil)
  end

  it "allows horizontal wins" do
    board = Board.new
    0.upto 3 do |i|
      board.play(i)
      board.play(i)
    end
    expect(WC.get_winner board.content).not_to eql(nil)
  end

  it "allows vertical wins" do
    board = Board.new
    0.upto 3 do |i|
      board.play(0)
      board.play(1)
    end
    expect(WC.get_winner board.content).not_to eql(nil)
  end

  it "allows backslash-diagonal wins" do
    moves = [0, 1, 1, 2, 2, 3, 2, 3, 3, 0, 3]
    board = Board.new
    for move in moves do
      board.play(move)
    end
    expect(WC.get_winner board.content).not_to eql(nil)
  end

  it "allows frontslash-diagonal wins" do
    moves = [3, 2, 2, 1, 1, 0, 1, 0, 0, 3, 0]
    board = Board.new
    for move in moves do
      board.play(move)
    end
    expect(WC.get_winner board.content).not_to eql(nil)
  end
end