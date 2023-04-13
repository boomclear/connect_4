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

  it 'computer_win methods diagonal right' do
    board = Board.new
    game = Game.new(board)
    expect(game.computer_win?).to eq(false)
    game.computer_win_diagonal_right
    expect(game.computer_win?).to eq(true)
    expect(game.computer_win).to output("You lost! :(\n").to_stdout
  end

  it 'computer_win methods diagonal left' do
    board = Board.new
    game = Game.new(board)
    expect(game.computer_win?).to eq(false)
    game.computer_win_diagonal_left
    expect(game.computer_win?).to eq(true)
    expect(game.computer_win).to output("You lost! :(\n").to_stdout
  end

  it 'player_win methods diagonal left' do
    board = Board.new
    game = Game.new(board)
    expect(game.player_win?).to eq(false)
    game.player_win_diagonal_left
    expect(game.player_win?).to eq(true)
    expect(game.player_win).to output("You won!\n").to_stdout
  end

  it 'player_win methods diagonal right' do
    board = Board.new
    game = Game.new(board)
    expect(game.player_win?).to eq(false)
    game.player_win_diagonal_right
    expect(game.player_win?).to eq(true)
    expect(game.player_win).to output("You won!\n").to_stdout
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

  it 'horizontal occupied computer' do
    board = Board.new
    game = Game.new(board)
    board.cells[1][1].value = "O"
    expect(game.hoz_occupied_computer?(1)).to eq(true)
  end

  it 'vertical occupied computer' do
    board = Board.new
    game = Game.new(board)
    board.cells[1][1].value = "O"
    expect(game.ver_occupied_computer?(1)).to eq(true)
  end

  it 'computer_win methods horizontal' do
    board = Board.new
    game = Game.new(board)
    expect(game.computer_win?).to eq(false)
    game.computer_win_horizontal
    expect(game.computer_win?).to eq(true)
    expect(game.computer_win).to output("You lost! :(\n").to_stdout
  end

  it 'computer_win methods vertical' do
    board = Board.new
    game = Game.new(board)
    expect(game.computer_win?).to eq(false)
    game.computer_win_vertical
    expect(game.computer_win?).to eq(true)
    expect(game.computer_win).to output("You lost! :(\n").to_stdout
  end

  it 'horizontal occupied player' do
    board = Board.new
    game = Game.new(board)
    board.cells[1][1].value = "X"
    expect(game.hoz_occupied_player?(1)).to eq(true)
  end

  it 'vertical occupied player' do
    board = Board.new
    game = Game.new(board)
    board.cells[1][1].value = "X"
    expect(game.ver_occupied_player?(1)).to eq(true)
  end

  it 'player_win methods horizontal' do
    board = Board.new
    game = Game.new(board)
    expect(game.player_win?).to eq(false)
    game.player_win_horizontal
    expect(game.player_win?).to eq(true)
    expect(game.player_win).to output("You won!\n").to_stdout
  end

  it 'player_win methods vertical' do
    board = Board.new
    game = Game.new(board)
    expect(game.player_win?).to eq(false)
    game.player_win_vertical
    expect(game.player_win?).to eq(true)
    expect(game.player_win).to output("You won!\n").to_stdout
  end
end