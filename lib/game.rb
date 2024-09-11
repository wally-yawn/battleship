require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_logic'

class Game

    def initialize
        @computer_board = Board.new
        @player_board = Board.new
        @computer_logic = Computer_logic.new(@computer_board)
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
    end

    def get_start_command
        input = gets.chomp.upcase
        if input == "P"
            @computer_logic.place_ship
            true
        elsif input == "Q"
            exit
        elsif input == "C"
            puts "Brody Nichols and Wally Wallace made this awesome game!"
            puts "------------------------------------------"
            puts "Press P to play, Q to quit, C for credits"
            false
        end
    end

    def enter_ship_coordinates(ship)
        coordinates = gets.chomp.upcase.split(" ")
        #happy path
        if @player_board.place(ship, coordinates) != true
            puts "Invalid coordinates, try again"
            false
        else true
        end
    end

    def enter_shot_coordinate
        coordinate = gets.chomp.upcase
        if @computer_board.valid_coordinate?(coordinate) == false
            puts "Please enter a valid coordinate:"
            false
        else 
            @computer_board.cells[coordinate].fire_upon
            puts @computer_board.render
            true
        end
    end

    def turn
        puts "\n\n\n\n\n\n\n\n\n"
        puts "=============COMPUTER BOARD============="
        puts @computer_board.render
        puts "==============PLAYER BOARD=============="
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        until enter_shot_coordinate == true
        end
    end

    def start
        puts "------------------------------------------"
        puts "         Welcome to Battleship!"
        puts "------------------------------------------"
        puts "Press P to play, Q to quit, C for credits"

        until get_start_command == true
        end

        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
        puts @player_board.render
        puts "Enter the squares for the Cruiser (3 spaces):"
        until enter_ship_coordinates(@cruiser) == true
        end
        puts @player_board.render(true)
        puts "Enter the squares for the Submarine (2 spaces):"
        until enter_ship_coordinates(@submarine) == true
        end
        turn
    end
end