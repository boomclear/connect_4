require 'spec_helper'

RSpec.describe Game do 
  it 'exists' do
    board = Board.new
    game = Game.new(board)

    expect(game).to be_a(Game)
  end
end
