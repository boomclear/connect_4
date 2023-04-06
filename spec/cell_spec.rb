require './lib/cell'

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
end