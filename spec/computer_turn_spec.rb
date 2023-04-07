require 'spec_helper'

RSpec.describe ComputerTurn do
  it 'exists' do
    computer_turn = ComputerTurn.new
    expect(computer_turn).to be_a(ComputerTurn)
  end

  it 'computer makes move method' do
    computer_turn = ComputerTurn.new
    board = Board.new
    expect(computer_turn.computer_makes_move(board)).to eq(nil)
  end
end