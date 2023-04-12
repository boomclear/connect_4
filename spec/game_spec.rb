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

  it 'player_win methods vertical' do
    board = Board.new
    game = Game.new(board)
    expect(game.player_win?).to eq(false)
    game.player_win_vertical
    expect(game.player_win?).to eq(true)
    expect(game.player_win).to output("You won!\n").to_stdout
  end

  it 'player_win methods horizontal' do
    board = Board.new
    game = Game.new(board)
    expect(game.player_win?).to eq(false)
    game.player_win_horizontal
    expect(game.player_win?).to eq(true)
    expect(game.player_win).to output("You won!\n").to_stdout
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

  it 'computer_win methods diagonal left' do
    board = Board.new
    game = Game.new(board)
    expect(game.computer_win?).to eq(false)
    game.computer_win_diagonal_left
    expect(game.computer_win?).to eq(true)
    expect(game.computer_win).to output("You lost! :(\n").to_stdout
  end

  it 'computer_win methods diagonal right' do
    board = Board.new
    game = Game.new(board)
    expect(game.computer_win?).to eq(false)
    game.computer_win_diagonal_right
    expect(game.computer_win?).to eq(true)
    expect(game.computer_win).to output("You lost! :(\n").to_stdout
  end

  it 'tie? method' do
    board = Board.new
    game = Game.new(board)
    expect(game.tie?).to eq(false)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "O", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "O", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "X", Cell.new("B", 4).value = "X", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "O", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "X", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "X", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "X", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.tie?).to eq(true)
  end

  it 'player_win_vertical method' do
    board = Board.new
    game = Game.new(board)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "O", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "X", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "X", Cell.new("B", 4).value = "O", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "X", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "X", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "X", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "X", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.player_win_vertical).to eq(true)
  end

  it 'player_win_horizontal method' do
    board = Board.new
    game = Game.new(board)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "X", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "X", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "O", Cell.new("B", 4).value = "O", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "X", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "X", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "X", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "X", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.player_win_vertical).to eq(true)
  end

  it 'player_win_diagonal left method' do
    board = Board.new
    game = Game.new(board)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "O", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "X", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "O", Cell.new("B", 4).value = "O", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "X", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "X", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "X", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "X", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.player_win_vertical).to eq(true)
  end

  it 'player_win_diagonal right method' do
    board = Board.new
    game = Game.new(board)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "O", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "X", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "O", Cell.new("B", 4).value = "O", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "X", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "X", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "X", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "X", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.player_win_vertical).to eq(true)
  end

  it 'computer_win_vertical method' do
    board = Board.new
    game = Game.new(board)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "O", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "X", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "O", Cell.new("B", 4).value = "O", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "X", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "X", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "X", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "X", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.player_win_vertical).to eq(true)
  end

  it 'computer_win_horizontal method' do
    board = Board.new
    game = Game.new(board)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "O", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "X", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "O", Cell.new("B", 4).value = "O", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "X", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "X", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "O", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "O", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.player_win_vertical).to eq(true)
  end

  it 'computer_win_diagonal left method' do
    board = Board.new
    game = Game.new(board)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "O", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "X", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "O", Cell.new("B", 4).value = "O", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "X", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "O", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "X", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "X", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.player_win_vertical).to eq(true)
  end

  it 'computer_win_diagonal right method' do
    board = Board.new
    game = Game.new(board)
    board.cells = [
      [Cell.new("A", 6).value = "X", Cell.new("B", 6).value = "X", Cell.new("C", 6).value = "O", Cell.new("D", 6).value = "X", Cell.new("E", 6).value = "O", Cell.new("F", 6).value = "X", Cell.new("G", 6).value = "O"],
      [Cell.new("A", 5).value = "X", Cell.new("B", 5).value = "X", Cell.new("C", 5).value = "X", Cell.new("D", 5).value = "O", Cell.new("E", 5).value = "O", Cell.new("F", 5).value = "X", Cell.new("G", 5).value = "O"],
      [Cell.new("A", 4).value = "O", Cell.new("B", 4).value = "O", Cell.new("C", 4).value = "X", Cell.new("D", 4).value = "O", Cell.new("E", 4).value = "O", Cell.new("F", 4).value = "X", Cell.new("G", 4).value = "X"],
      [Cell.new("A", 3).value = "X", Cell.new("B", 3).value = "O", Cell.new("C", 3).value = "O", Cell.new("D", 3).value = "X", Cell.new("E", 3).value = "X", Cell.new("F", 3).value = "O", Cell.new("G", 3).value = "O"],
      [Cell.new("A", 2).value = "O", Cell.new("B", 2).value = "O", Cell.new("C", 2).value = "X", Cell.new("D", 2).value = "O", Cell.new("E", 2).value = "O", Cell.new("F", 2).value = "X", Cell.new("G", 2).value = "X"],
      [Cell.new("A", 1).value = "O", Cell.new("B", 1).value = "X", Cell.new("C", 1).value = "O", Cell.new("D", 1).value = "X", Cell.new("E", 1).value = "O", Cell.new("F", 1).value = "X", Cell.new("G", 1).value = "O"]
    ]
    expect(game.player_win_vertical).to eq(true)
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
end
