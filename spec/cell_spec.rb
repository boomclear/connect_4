require 'spec_helper'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("A", 1)
    expect(cell).to be_a(Cell)
  end

  it 'has attributes' do
    cell = Cell.new("A", 1)
    expect(cell.column).to eq("A")
    expect(cell.row).to eq(1)
    expect(cell.value).to eq("*")
  end

  it 'occupied player and computer?' do
    cell = Cell.new("A", 1)
    expect(cell.occupied_player).to eq(false)
    expect(cell.occupied_computer).to eq(false)
    cell.value = "X"
    expect(cell.occupied_player?).to eq(true)
    cell.value = "O"
    expect(cell.occupied_computer?).to eq(true)

  end
end