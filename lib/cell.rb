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

  def type
    
  end

  def occupied_player?
    if @value == "X"
      @occupied_player = true
    end
  end

  def occupied_computer?
end