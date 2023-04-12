class Cell
  attr_reader :column,
              :row,
              :occupied_player,
              :occupied_computer
  attr_accessor :value

  def initialize(column, row)
    @column = column
    @row = row
    @value = "*"
  end

  def occupied_player?
    if @value == "*"
      false
    elsif @value == "X"
      true
    end
  end

  def occupied_computer?
    if @value == "*"
      false
    elsif @value == "O"
      true
    end
  end
end