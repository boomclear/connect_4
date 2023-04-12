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
    require 'pry'; binding.pry
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

  it 'player_win methods diagonal' do
    board = Board.new
    game = Game.new(board)
    expect(game.player_win?).to eq(false)
    game.player_win_diagonal
    expect(game.player_win?).to eq(true)
    expect(game.player_win).to output("You won!\n").to_stdout
  end

  it 'tie? method' do
    board = Board.new
    game = Game.new(board)
    expect(game.tie?).to eq(false)
    board.cells.map do |row|
      row.map do |cell|
        cell.value = "X"
      end
    end
    expect(game.tie?).to eq(true)
  end
end
