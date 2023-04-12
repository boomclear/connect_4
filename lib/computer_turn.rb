class ComputerTurn
  attr_accessor :array_pos, :location
  def initialize
    @array_pos = 5
    @location = ""
  end

  def computer_makes_move(board)
    location_array = board.columns.keys
    @location = location_array.sample
    @array_pos = 5
    
    if @location == "A"
      @location = 0
      until board.cells[@array_pos][0].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][0].value == "*"
        board.cells[@array_pos][0].value = "O"
        board.render_board
        board.print_board
      else
        computer_makes_move(board)
      end

    elsif @location == "B"
      @location = 1
      until board.cells[@array_pos][1].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][1].value == "*"
        board.cells[@array_pos][1].value = "O"
        board.render_board
        board.print_board
      else
        computer_makes_move(board)
      end

    elsif @location == "C"
      @location = 2
      until board.cells[@array_pos][2].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][2].value == "*"
        board.cells[@array_pos][2].value = "O"
        board.render_board
        board.print_board
      else
        computer_makes_move(board)
      end

    elsif @location == "D"
      @location = 3
      until board.cells[@array_pos][3].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][3].value == "*"
        board.cells[@array_pos][3].value = "O"
        board.render_board
        board.print_board
      else
        computer_makes_move(board)
      end

    elsif @location == "E"
      @location = 4
      until board.cells[@array_pos][4].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][4].value == "*"
        board.cells[@array_pos][4].value = "O"
        board.render_board
        board.print_board
      else
        computer_makes_move(board)
      end

    elsif @location == "F"
      @location = 5
      until board.cells[@array_pos][5].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][5].value == "*"
        board.cells[@array_pos][5].value = "O"
        board.render_board
        board.print_board
      else
        computer_makes_move(board)
      end

    elsif @location == "G"
      @location = 6
      until board.cells[@array_pos][6].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][6].value == "*"
        board.cells[@array_pos][6].value = "O"
        board.render_board
        board.print_board
      else
        computer_makes_move(board)
      end

    end
  end
end
