require './lib/cell'
require './lib/ship'
require './lib/board'

class Computer_logic

    attr_reader :board, :cruiser, :submarine, :ships
    
    def initialize(board)
        @board = board
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
        @ships = [@cruiser, @submarine]
    end

    def place_ship
        @ships.each do |ship|
            coordinates = []
            ship.length.times do    
                coordinates << @board.cells.keys.sample
            end
            until @board.valid_placement?(ship, coordinates) == true && @board.occupied?(coordinates) == false do
                coordinates = []    
                ship.length.times do    
                    coordinates << @board.cells.keys.sample
                end
            end
            @board.place(ship, coordinates)
        end
    end

    def enter_shot_coordinate(board, coordinate = nil)
        if coordinate == nil 
            coordinate = board.cells.keys.sample
        end

        cell = board.cells[coordinate]

        if cell.fired_upon? == false
            cell.fire_upon
            puts board.render

            if cell.ship == nil
                puts "My shot on #{cell.coordinate} was a miss"
            else
               if cell.ship.sunk?
                    puts "I sunk your battleship!"
               else puts "My shot on #{cell.coordinate} was a hit!"
               end
            end
            true
        else
            false
        end
    end

end