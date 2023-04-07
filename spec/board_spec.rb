require 'spec_helper'

RSpec.describe Board do 
  it "exists" do 
    board = Board.new

    expect(board).to be_a Board
  end

  it "has attributes" do
    board = Board.new

    expect(board.cells).to be_a(Array)
    expect(board.columns).to be_a(Hash)
  end

  it 'can render board' do
    board = Board.new

    expect(board.render_board).to be_a Array
  end

  it 'can print board' do
    board = Board.new 
    require "pry"; binding.pry
    expect(board.print_board).to eq(nil)
  end
end