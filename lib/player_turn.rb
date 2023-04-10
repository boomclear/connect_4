class PlayerTurn
  attr_accessor :array_pos, :location
  def initialize
    @array_pos = 5
    @location = ""
  end

  def player_makes_move(board)
    puts "Which column would you like to drop your chip?"
    @location = $stdin.gets.chomp.upcase
    @array_pos = 5
    
    if @location == "A"
      @location = 0
      until board.cells[@array_pos][0].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][0].value == "*"
        board.cells[@array_pos][0].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif @location == "B"
      @location = 1
      until board.cells[@array_pos][1].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][1].value == "*"
        board.cells[@array_pos][1].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif @location == "C"
      @location = 2
      until board.cells[@array_pos][2].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][2].value == "*"
        board.cells[@array_pos][2].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif @location == "D"
      @location = 3
      until board.cells[@array_pos][3].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][3].value == "*"
        board.cells[@array_pos][3].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif @location == "E"
      @location = 4
      until board.cells[@array_pos][4].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][4].value == "*"
        board.cells[@array_pos][4].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif @location == "F"
      @location = 5
      until board.cells[@array_pos][5].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][5].value == "*"
        board.cells[@array_pos][5].value = "X"
        board.render_board
        board.print_board
      else
        puts "Please input a valid column, this one is full!"
        player_makes_move(board)
      end

    elsif @location == "G"
      @location = 6
      until board.cells[@array_pos][6].value == "*" || @array_pos == 0 do 
        @array_pos -= 1
      end
      
      if board.cells[@array_pos][6].value == "*"
        board.cells[@array_pos][6].value = "X"
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
