class PlayerTurn
  def player_makes_move(board)
    puts "Which column would you like to drop your chip?"
    location = "#{gets.chomp.upcase}"
    array_pos = 5
    
    if location == "A"
      until board.cells[array_pos][0].value == "*" || array_pos == 0 do 
        array_pos -= 1
      end
      
      if board.cells[array_pos][0].value == "*"
        board.cells[array_pos][0].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif location == "B"
      until board.cells[array_pos][1].value == "*" || array_pos == 0 do 
        array_pos -= 1
      end
      
      if board.cells[array_pos][1].value == "*"
        board.cells[array_pos][1].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif location == "C"
      until board.cells[array_pos][2].value == "*" || array_pos == 0 do 
        array_pos -= 1
      end
      
      if board.cells[array_pos][2].value == "*"
        board.cells[array_pos][2].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif location == "D"
      until board.cells[array_pos][3].value == "*" || array_pos == 0 do 
        array_pos -= 1
      end
      
      if board.cells[array_pos][3].value == "*"
        board.cells[array_pos][3].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif location == "E"
      until board.cells[array_pos][4].value == "*" || array_pos == 0 do 
        array_pos -= 1
      end
      
      if board.cells[array_pos][4].value == "*"
        board.cells[array_pos][4].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif location == "F"
      until board.cells[array_pos][5].value == "*" || array_pos == 0 do 
        array_pos -= 1
      end
      
      if board.cells[array_pos][5].value == "*"
        board.cells[array_pos][5].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif location == "G"
      until board.cells[array_pos][6].value == "*" || array_pos == 0 do 
        array_pos -= 1
      end
      
      if board.cells[array_pos][6].value == "*"
        board.cells[array_pos][6].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end
    
    else
      puts "Please input a valid column: A, B, C, D, E, F, or G"
      player_makes_move(board)

    end
  end
end
