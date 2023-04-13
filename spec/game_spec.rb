require 'spec_helper'

RSpec.describe Game do 
  it 'exists' do
    board = Board.new
    game = Game.new(board)
    expect(game).to be_a(Game)
  end

  it 'has attributes' do
    board_1 = Board.new
    game = Game.new(board_1)
    expect(game.board).to eq(board_1)
    expect(game.player).to be_a(PlayerTurn)
    expect(game.computer).to be_a(ComputerTurn)
    expect(game.player_turn).to eq(0)
    expect(game.computer_turn).to eq(0)
  end

  it 'main_menu method with P' do
    board = Board.new
    game = Game.new(board)
    allow($stdin).to receive(:gets).and_return("P\n") 
    expect(game).to receive(:start)
    game.main_menu
  end
  
  it 'main_menu method with Q' do
    board = Board.new
    game = Game.new(board)
    allow($stdin).to receive(:gets).and_return("Q\n") 
    expect(game).to receive(:main_menu)
    game.main_menu
  end

  it 'diagonal occupied computer' do
    board = Board.new
    game = Game.new(board)
    board.cells[1][1].value = "O"
    expect(game.diagnoal_occupied_computer?(1,1)).to eq(true)
  end

  it 'diagonal occupied player' do
    board = Board.new
    game = Game.new(board)
    board.cells[1][1].value = "X"
    expect(game.diagnoal_occupied_player?(1,1)).to eq(true)
  end
end