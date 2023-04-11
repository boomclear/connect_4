require 'spec_helper'

RSpec.describe PlayerTurn do
  it 'exists' do
    player = PlayerTurn.new
    expect(player).to be_a(PlayerTurn)
  end

  it 'attributes' do
    player = PlayerTurn.new
    expect(player.array_pos).to eq(5)
    expect(player.location).to eq("")
  end

  it 'player makes move method' do
    player = PlayerTurn.new
    board = Board.new
    @location = "A"
    # board.cells[5][0].value = "X"
    # board.cells[4][1].value = "O"
    # board.cells[5][2].value = "X"
    # expect(board.render_board[5][0]).to eq("X")
    # expect(board.render_board[4][1]).to eq("O")
    # expect(board.render_board[5][2]).to eq("X")

# This method needs work

    expect(player.player_makes_move(board)).to eq(nil)
    expect(board.cells[]).to eq
  end


end