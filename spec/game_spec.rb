require 'spec_helper'

RSpec.describe Game do 
  it 'exists' do
    board = Board.new
    game = Game.new(board)
    expect(game).to be_a(Game)
  end

  it 'has attributes' do
    board = Board.new
    game = Game.new(board)
    expect(game.board).to eq(board)
    expect(game.player).to be_a(PlayerTurn)
    expect(game.computer).to be_a(ComputerTurn)
    expect(game.player_turn).to eq(0)
    expect(game.computer_turn).to eq(0)
  end

  it 'main_menu method' do
    board = Board.new
    game = Game.new(board)
    expect(board.main_menu).to eq("Welcome to Connect 4" "Press P to play and Q to quit")
  end
end
