class Cell
  attr_reader :column,
              :row
  attr_accessor :value

  def initialize(column, row)
    @column = column
    @row = row
    @value = "*"
  end

  def type
    
  end
end