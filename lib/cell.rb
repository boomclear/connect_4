class Cell
  attr_reader :column,
              :row
  attr_accessor :value

  def initialize(column, row)
    @column = column
    @row = row
    @value = "*"
  end

  def occupied_player?
    if @value == "*"
      return false
    elsif @value == "X"
      return true
    end
  end

  def occupied_computer?
    if @value == "*"
      return false
    elsif @value == "O"
      return true
    end
  end
end