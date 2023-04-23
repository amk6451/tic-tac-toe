class Game
    def initialize()
        @player_choice = "X"
        @computer_choice = "O"
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
        puts self.display_board()
        pos = gets.chomp.to_i
        if (pos > 0) && @grid[pos] != ("X" || "O")
            @grid[pos] = "X"
            # puts @grid
            puts display_board()
        else
            puts "location not available, choice a different spot "
        end
        # return display_board()
    end

    def choose_piece()
    end

    def computer_choice()
        rand(1)
    end

    def win_condition()
        #win for X
        if (
            #horizontal
            (@grid[1] == "X" && @grid[2] == "X" && @grid[3] == "X" )||
            (@grid[4] == "X" && @grid[5] == "X" && @grid[6] == "X")||
            (@grid[7] == "X" && @grid[8] == "X" && @grid[9] == "X")||
            # vertical
            (@grid[1] == "X" && @grid[4] == "X" && @grid[7] == "X")||
            (@grid[2] == "X" && @grid[5] == "X" && @grid[8] == "X")||
            (@grid[3] == "X" && @grid[6] == "X" && @grid[9] == "X")||
            # diagonal
            (@grid[1] == "X" && @grid[5] == "X" && @grid[9] == "X" )||
            (@grid[3] == "X" && @grid[5] == "X" && @grid[7] == "X" )  
        ) == true
            puts @grid
            puts "you win"
            return true
        else
            return false
        end
    end

end

a = Game.new()
until a.win_condition
    print 'Choose a square'
    a.update_hash()
end