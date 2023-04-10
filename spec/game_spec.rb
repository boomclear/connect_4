require 'spec_helper'

RSpec.describe Game do 
  it 'exists' do
    board = Board.new
    game = Game.new(board)
    require 'pry'; binding.pry
    expect(game).to be_a(Game)
  end
end
