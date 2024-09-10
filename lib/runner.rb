require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_logic'

class Runner

    def self.get_start_command
        imput = gets.chomp
        if imput == "P"
            @computer_logic.place
            true
        elsif imput == "Q"
            exit
        else
            false
        end
    end

    def self.start
        @board = Board.new
        @computer_logic = Computer_logic.new
        puts "------------------------------------------"
        puts "         Welcome to Battleship!"
        puts "------------------------------------------"
        puts "Press P to play, Q to quit, C for credits"

        until get_start_command == true

        end
        
    
     #   if gets == "P" 
      #      computer_logic.place


       # elsif gets == "Q"
         #   exit

        #else puts "Press P to play, Q to quit, C for credits"
          #  until gets == "P" || "Q"

        #end
    end

    Runner.start
end