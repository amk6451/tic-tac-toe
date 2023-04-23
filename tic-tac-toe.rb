class Game
    #player_choice is "X"
    #computer_choice is "O"
    attr_accessor :available
    def initialize()
        @grid = { 
            1=> '1', 2 => '2', 3 => '3',
            4 => '4', 5 => '5', 6 => '6',
            7 => '7', 8 => '8', 9 => '9'
        }
        @available = [1,2,3,4,5,6,7,8,9]
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

    #updates board with position given, and removes position from the available list after
    def update_hash(position, chip)
            @grid[position] = chip
            @available.delete(position)
            puts display_board()
    end

    #computer randomly selects from the available squares
    def computer_choice()
       x =  @available.sample
       puts "computer chose #{x}"
       return x
    end

    #checks for winning combinations for player or computer
    def win_condition(chip)
        
        if (
            #horizontal
            (@grid[1] == chip && @grid[2] == chip && @grid[3] == chip )||
            (@grid[4] == chip && @grid[5] == chip && @grid[6] == chip)||
            (@grid[7] == chip && @grid[8] == chip && @grid[9] == chip)||
            # vertical
            (@grid[1] == chip && @grid[4] == chip && @grid[7] == chip)||
            (@grid[2] == chip && @grid[5] == chip && @grid[8] == chip)||
            (@grid[3] == chip && @grid[6] == chip && @grid[9] == chip)||
            # diagonal
            (@grid[1] == chip && @grid[5] == chip && @grid[9] == chip )||
            (@grid[3] == chip && @grid[5] == chip && @grid[7] == chip )  
        ) == true
            return true
        else
            return false
        end
    end

end

#initializes the tic-tac-toe game
a = Game.new()

#continues game until a winner is found vs computer, or tied
while true
    puts "Choose a square " +"\n"
    puts a.display_board()

    pos = 0

    #check if valid spot is input, .to_i returns 0 otherwise
    until a.available.include?(pos)
        puts "please give a valid number"
        pos = gets.chomp.to_i
    end

    a.update_hash(pos, "X")

    #after selecting a position, check for winner
    if a.win_condition("X") == true
        puts "you win"
        break
    end

    #if no winner is found, check if tied
    if a.available.empty? == true
        puts "tied game"
        break
    end

    #computer selects an available space
    a.update_hash(a.computer_choice(), "O")

    #after selecting a position, check for winner
    if a.win_condition("O") == true
        puts "you lose"
        break
    end

    #if no winner is found, check if tied
    if a.available.empty? == true
        puts "tied game"
        break
    end

end