require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_logic'

class Game

    def initialize
        @computer_logic = Computer_logic.new

    end

    def get_start_command
        imput = gets.chomp.upcase
        if imput == "P"
            @computer_logic.place
            true
        elsif imput == "Q"
            exit
        else
            false
        end
    end

    def start
        puts "------------------------------------------"
        puts "         Welcome to Battleship!"
        puts "------------------------------------------"
        puts "Press P to play, Q to quit, C for credits"

        get_start_command
    end
end