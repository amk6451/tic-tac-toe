class Game
    def initialize(player_choice, computer_choice)
        @player_choice = player_choice
        @computer_choice = computer_choice
        @grid = { 
            1=> '1', 2 => '2', 3 => '3',
            4 => '4', 5 => '5', 6 => '6',
            7 => '7', 8 => '8', 9 => '9'
        }
        self.display_board()
    end

    def display_board()
        puts 
        " #{@grid[1]} " "|" " #{@grid[2]} " "|" " #{@grid[3]}\n"+ 
        "-----------\n"+
        " #{@grid[4]} " "|" " #{@grid[5]} " "|" " #{@grid[6]}\n"+
        "-----------\n"+
        " #{@grid[7]} " "|" " #{@grid[8]} " "|" " #{@grid[9]} \n"+
        "\n"
      end

    def update_hash()
    end

    def win_condition()
    end


end

a = Game.new("test", "values")
puts a.display_board()