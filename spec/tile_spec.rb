require './lib/tile'

describe Tile do
  it "has a default" do
    tile = Tile.new
    expect(tile.content).to eql(tile.DEFAULT)
  end

  it "can be updated" do
    tile = Tile.new
    tile.set_content('x')
    expect(tile.content).to eql('x')
  end
  it "cannot be overwritten" do
    tile = Tile.new
    tile.set_content('x')
    tile.set_content('o')
    expect(tile.content).to eql('x')
  end
end