class PlayerTurn

  def initialize

  end

  def player_makes_move
    puts "What column do you want your piece in?"

    location_array = ["A","B","C","D","E","F","G"]
    if user == "computer"
      location = location_array.sample
    else
      location = "#{gets.chomp.upcase}"
    end
    if location_array.include?(location) == false
      puts "Choose another column!"
      location = "#{gets.chomp.upcase}"
    end
    if @columns[location].count == 6
      puts "Choose another column!"
      location = "#{gets.chomp.upcase}"
    end
  end
    if location == "A"
      gravity = -1
      @columns["A"] << Chip.new.type[user]
      gravity += @columns["A"].count
      if gravity > 5 
        return puts "Choose another column!"
      end
      @cells[5 - gravity][0].value = columns["A"].last
      render_board
      print_board
    end
end
