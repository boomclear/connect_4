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
      @player_turn = @player
      @player_turn.player_makes_move(@board)
      break if player_win?
      break if tie?
      @computer_turn = @computer
      @computer_turn.computer_makes_move(@board)
      break if player_win?
      break if tie?
    end
  end

  def player_win?
    if player_win_vertical && player_win_horizontal
      player_win
      return true
    else
      return false
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
        return false
    else
        return true
    end
  end


  def player_win_horizontal
    chip_count = 1
    location = @player_turn.location
    while @board.cells[@player_turn.array_pos][@player_turn.location].occupied_player? && @player_turn.location > 5 && chip_count < 4
      chip_count += 1
      @player_turn.location += 1
    end
    while @board.cells[@player_turn.array_pos][location].occupied_player? && location < 0 && chip_count < 4
      chip_count += 1
      location -= 1
    end
    if chip_count >= 4
      true
    elsif chip_count < 4
      chip_count = 1
      false
    end
  end

  def player_win_vertical
    chip_count = 1
    while @board.cells[@player_turn.array_pos][@player_turn.location].occupied_player? && @player_turn.array_pos > 0 && chip_count < 4
      chip_count += 1
      @player_turn.array_pos -= 1
    end
    if chip_count >= 4
      return true
    elsif chip_count < 4
      chip_count = 1
      return false
    end
  end

end






# Main Menu (P to Play) main_menu method
# Start the game, Player first start method game_start method
# Alternate turns while checking for win/tie conditions winner? method, tie? method
# end the game and return to main menu/or ask if player wants to play again end_game method 