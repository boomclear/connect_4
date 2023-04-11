class ComputerTurn
  attr_reader :array_pos
  def initialize
    @array_pos = 5
  end

  def computer_makes_move(board)
    location_array = board.columns.keys
    location = location_array.sample
    
    if location == "A"
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

    elsif location == "B"
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

    elsif location == "C"
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

    elsif location == "D"
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

    elsif location == "E"
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

    elsif location == "F"
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

    elsif location == "G"
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
