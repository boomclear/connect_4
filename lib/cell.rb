class Cell
  attr_reader :column,
              :row
  attr_accessor :value

  def initialize(column, row)
    @column = column
    @row = row
    @value = "*"
    @occupied_player = false
    @occupied_computer = false
  end

  def occupied_player?
    if @value == "X"
      true
    else
      false
    end
  end

  def occupied_computer?
    if @value == "O"
      true
    else
      false
    end
  end
end