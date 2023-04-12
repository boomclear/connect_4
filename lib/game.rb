class Game
  attr_reader :board,
              :player,
              :computer,
              :player_turn,
              :computer_turn
  def initialize(board)
    @board = board
    @player = PlayerTurn.new
    @computer = ComputerTurn.new
    @player_turn = 0
    @computer_turn = 0
  end

  def main_menu
    puts "Welcome to Connect 4"
    puts "Press P to play and Q to quit"
    play_or_not = $stdin.gets.chomp.upcase
    if play_or_not == "P"
      self.start
    elsif play_or_not == "Q"
      main_menu
    else
      puts "Please put P or Q"
      main_menu
    end
  end

  def start
    @board.render_board
    @board.print_board
    loop do
      @player_turn = @player
      @player_turn.player_makes_move(@board)
      break if player_win?
      break if tie?
      @computer_turn = @computer
      @computer_turn.computer_makes_move(@board)
      break if computer_win?
      break if tie?
    end
  end

  def player_win?
    if player_win_vertical || player_win_horizontal || player_win_diag_left || player_win_diag_right
      player_win
      true
    else
      false
    end
  end
  
  def computer_win?
    if computer_win_vertical || computer_win_horizontal || computer_win_diag_left || computer_win_diag_right
      computer_win
      true
    else
      false
    end
  end

  def computer_win
    puts 'You lost! :('
    @board = Board.new
    self.main_menu
  end

  def player_win
    puts 'You won!'
    @board = Board.new
    self.main_menu
  end

  def tie?
    is_tie = @board.cells.map do |cell|
      cell.find_all do |one_cell|
        one_cell.value == "*"
        end
      end
       !is_tie
  end

  def computer_win_diag_right
    chip_count = 1
    left = @computer_turn.location - 1
    right = @computer_turn.location + 1
    top = @computer_turn.array_pos + 1
    bottom = @computer_turn.array_pos - 1
  
    until left < 0 || bottom < 0 || !diagnoal_occupied_computer?(bottom, left)
      chip_count += 1
      left -= 1
      bottom -= 1
    end
  
    until right > 6 || top > 5 || !diagnoal_occupied_computer?(top, right)
      chip_count += 1
      right += 1
      top += 1
    end
  
    chip_count >= 4
  end

  def computer_win_diag_left
    chip_count = 1
    left = @computer_turn.location - 1
    right = @computer_turn.location + 1
    top = @computer_turn.array_pos + 1
    bottom = @computer_turn.array_pos - 1
  
    until left < 0 || top > 5 || !diagnoal_occupied_computer?(top, left)
      chip_count += 1
      left -= 1
      top += 1
    end
  
    until right > 6 || bottom < 0 || !diagnoal_occupied_computer?(bottom, right)
      chip_count += 1
      right += 1
      bottom -= 1
    end

    chip_count >= 4
  end

  def player_win_diag_left
    chip_count = 1
    left = @player_turn.location - 1
    right = @player_turn.location + 1
    top = @player_turn.array_pos + 1
    bottom = @player_turn.array_pos - 1
  
    until left < 0 || top > 5 || !diagnoal_occupied_player?(top, left)
      chip_count += 1
      left -= 1
      top += 1
    end
  
    until right > 6 || bottom < 0 || !diagnoal_occupied_player?(bottom, right)
      chip_count += 1
      right += 1
      bottom -= 1
    end

    chip_count >= 4
  end

  def player_win_diag_right
    chip_count = 1
    left = @player_turn.location - 1
    right = @player_turn.location + 1
    top = @player_turn.array_pos + 1
    bottom = @player_turn.array_pos - 1
  
    until left < 0 || bottom < 0 || !diagnoal_occupied_player?(bottom, left)
      chip_count += 1
      left -= 1
      bottom -= 1
    end
  
    until right > 6 || top > 5 || !diagnoal_occupied_player?(top, right)
      chip_count += 1
      right += 1
      top += 1
    end
  
    chip_count >= 4
  end

  def computer_win_horizontal
    chip_count = 1
    left = @computer_turn.location - 1
    right = @computer_turn.location + 1
  
    until left < 0 || !hoz_occupied_computer?(left)
      chip_count += 1
      left -= 1
    end
  
    until right > 6 || !hoz_occupied_computer?(right)
      chip_count += 1
      right += 1
    end
  
    chip_count >= 4
  end

  def diagnoal_occupied_computer?(pos1, pos2)
    @board.cells[pos1][pos2].occupied_computer?
  end

  def diagnoal_occupied_player?(pos1, pos2)
    @board.cells[pos1][pos2].occupied_player?
  end

  def hoz_occupied_computer?(pos)
    @board.cells[@computer_turn.array_pos][pos].occupied_computer?
  end

  def ver_occupied_computer?(pos)
    @board.cells[pos][@computer_turn.location].occupied_computer?
  end

  def computer_win_vertical
    chip_count = 1
    top = @computer_turn.array_pos - 1
    bottom = @computer_turn.array_pos + 1

    until top < 0 || !ver_occupied_computer?(top)
      chip_count += 1
      top -= 1
    end
  
    until bottom > 5 || !ver_occupied_computer?(bottom)
      chip_count += 1
      bottom += 1
    end
  
    chip_count >= 4
  end


  def player_win_horizontal
    chip_count = 1
    left = @player_turn.location - 1
    right = @player_turn.location + 1
  
    until left < 0 || !hoz_occupied_player?(left)
      chip_count += 1
      left -= 1
    end
  
    until right > 6 || !hoz_occupied_player?(right)
      chip_count += 1
      right += 1
    end
  
    chip_count >= 4
  end

  def hoz_occupied_player?(pos)
    @board.cells[@player_turn.array_pos][pos].occupied_player?
  end

  def ver_occupied_player?(pos)
    @board.cells[pos][@player_turn.location].occupied_player?
  end

  def player_win_vertical
    chip_count = 1
    top = @player_turn.array_pos - 1
    bottom = @player_turn.array_pos + 1

    until top < 0 || !ver_occupied_player?(top)
      chip_count += 1
      top -= 1
    end
  
    until bottom > 5 || !ver_occupied_player?(bottom)
      chip_count += 1
      bottom += 1
    end
  
    chip_count >= 4
  end
end

