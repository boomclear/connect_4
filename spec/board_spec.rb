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
    expect(board.render_board[0][0]).to eq("*")
    expect(board.render_board[0][2]).to eq("*")
    board.cells[5][0].value = "X"
    board.cells[4][1].value = "O"
    board.cells[5][2].value = "X"
    expect(board.render_board[5][0]).to eq("X")
    expect(board.render_board[4][1]).to eq("O")
    expect(board.render_board[5][2]).to eq("X")
  end

  it 'can print board' do
    board = Board.new 
    expect(board.print_board).to eq(nil)
  end
end