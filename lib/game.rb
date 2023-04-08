class Game 
  def initialize(board)
    @board = board
    @player = PlayerTurn.new
    @computer = ComputerTurn.new
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
      @player.player_makes_move(@board)
        break if win?
        break if tie?
      @computer.computer_makes_move(@board)
        break if win?
        break if tie?
  end

  def win?
    if win_horizontal || win_vertical || win_diagonal

    end

  end

  def tie?


  end
end






# Main Menu (P to Play) main_menu method
# Start the game, Player first start method game_start method
# Alternate turns while checking for win/tie conditions winner? method, tie? method
# end the game and return to main menu/or ask if player wants to play again end_game method 