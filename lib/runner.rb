require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_logic'

class Runner

    def self.get_start_command
        input = gets.chomp.downcase
        if input == "p"
            @computer_logic.place_ship
            true
        elsif input == "q"
            exit
        elsif input == "c"
            puts "Brody Nichols and Wally Wallace made this awesome game!"
            puts "------------------------------------------"
            puts "Press P to play, Q to quit, C for credits"
            false
        end
    end

    def self.start
        @board = Board.new
        @computer_logic = Computer_logic.new(@board)
        puts "------------------------------------------"
        puts "         Welcome to Battleship!"
        puts "------------------------------------------"
        puts "Press P to play, Q to quit, C for credits"

        until get_start_command == true
        end

        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
        puts @board.render
        puts "Enter the squares for the Cruiser (3 spaces):"
        
        #player ship placement implementation

    end

    Runner.start
end