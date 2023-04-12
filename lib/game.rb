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
    loop do
      @player_turn = @player.player_makes_move(@board)
      break if player_win?
      break if tie?
      @computer_turn = @computer.computer_makes_move(@board)
      break if player_win?
      break if tie?
    end
  end

  def player_win?
    if player_win_vertical || player_win_horizontal || player_win_diagonal
      player_win
      true
    else
      false
    end
  end

  def player_win
    puts 'You won!'
    self.main_menu
  end

  def tie?
    if @board.cells.map do |cell|
      cell.find do |one_cell|
        one_cell.value == "*"
        end
      end
        false
    else
        true
    end
  end


  # def player_win_horizontal
  #   chip_count = 1
  #   until !@board.cells[@player_turn.array_pos][@player_turn.location].occupied_player? || @player_turn.array_pos == 5 || chip_count == 4
  #     chip_count += 1
  #     @player_turn.array_pos += 1
  #   end
  #   until !@board.cells[@player_turn.array_pos][@player_turn.location].occupied_player? || @player_turn.array_pos == 0 || chip_count == 4
  #     chip_count += 1
  #     @player_turn.array_pos -= 1
  #   end
  #   if chip_count >= 4
  #     true
  #   else
  #     chip_count = 0
  #     false
  #   end
  # end

  def player_win_horizontal
    chip_count = 1
    left = @player_turn.location - 1
    right = @player_turn.location + 1
  
    # Check left
    until left < 0 || !@board.cells[@player_turn.array_pos][left].occupied_player? || @board.cells[@player_turn.array_pos][left].value != @player.chip
      chip_count += 1
      left -= 1
    end
  
    # Check right
    until right > 6 || !@board.cells[@player_turn.array_pos][right].occupied_player? || @board.cells[@player_turn.array_pos][right].value != @player.chip
      chip_count += 1
      right += 1
    end
  
    chip_count >= 4
  end


  def player_win_vertical
    chip_count = 1
    until !@board.cells[@player_turn.array_pos][@player_turn.location].occupied_player? || @player_turn.location == 6 || chip_count == 4
      chip_count += 1
      @player_turn.location += 1
    end
    until !@board.cells[@player_turn.array_pos][@player_turn.location].occupied_player? || @player_turn.location == 0 || chip_count == 4
      chip_count += 1
      @player_turn.location -= 1
    end
    if chip_count >= 4
      true
    else
      chip_count = 0
      false
    end
  end

  # def player_win_vertical
  #   chip_count = 1
  #   top = @player_turn.array_pos - 1
  #   bottom = @player_turn.array_pos + 1
  
  #   # Check top
  #   until top < 0 || !@board.cells[top][@player_turn.location].occupied_player? || @board.cells[top][@player_turn.location].value != @player.chip
  #     chip_count += 1
  #     top -= 1
  #   end
  
  #   # Check bottom
  #   until bottom > 5 || !@board.cells[bottom][@player_turn.location].occupied_player? || @board.cells[bottom][@player_turn.location].value != @player.chip
  #     chip_count += 1
  #     bottom += 1
  #   end
  
  #   chip_count >= 4
  # end
end






# Main Menu (P to Play) main_menu method
# Start the game, Player first start method game_start method
# Alternate turns while checking for win/tie conditions winner? method, tie? method
# end the game and return to main menu/or ask if player wants to play again end_game method 