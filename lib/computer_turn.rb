class ComputerTurn
  attr_reader :columns

  def initialize
    @columns = {"A" => [], "B" => [], "C" => [], "D" => [], "E" => [], "F" => [], "G" => []}
  end

  def computer_makes_move
    puts "Select the column to drop your coin"
    location_array = ["A","B","C","D","E","F","G"]
    location = location_array.sample

    if location == "A"
      bottom_to_top = -1
      @columns["A"] << Chip.new.type[user]
      bottom_to_top += @columns["A"].count
      if bottom_to_top > 5 
        return puts "Choose another column!"
      end
      @cells[5 - bottom_to_top][0].value = columns["A"].last
      render_board
      print_board
    end
end
