class ComputerTurn
  attr_reader :columns

  def initialize

  end

  def computer_makes_move(board)
    puts "Select the column to drop your coin"
    location_array = board.columns.keys
    location = location_array.sample

    if location == "A"

      
    end
      start from bottom...check if "*"
      if not *, move up one index position
        check for * again, if not *, move up one index position
        if move up 6, then "Choose another column"

    if "B"
      repeat
          
      # until board.cell.value == "*" then place piece
      # else move up one...loop 
      #   start with bottom index position


      end
      bottom_to_top = -1
      board.columns["A"][bottom_to_top] << board.cell.value
      bottom_to_top += @columns["A"].count
      if bottom_to_top > 5 
        return puts "Choose another column!"
      end
      @cells[5 - bottom_to_top][0].value = columns["A"].last
      render_board
      print_board
    end
end
