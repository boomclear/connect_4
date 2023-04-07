require 'spec_helper'

RSpec.describe PlayerTurn do
  it 'exists' do
    player = PlayerTurn.new
    expect(player).to be_a(PlayerTurn)
  end

  it 'player makes move method' do
    player = PlayerTurn.new
    board = Board.new
    require 'pry'; binding.pry
    expect(player.player_makes_move(board)).to eq(nil)
  end
end