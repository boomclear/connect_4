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
end