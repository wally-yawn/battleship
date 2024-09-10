require './lib/cell'
require './lib/ship'
require './lib/board'

class Computer_logic

    attr_reader :board, :cruiser, :submarine, :ships
    
    def initialize
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
        @ships = [@cruiser, @submarine]
    end

    def place_cruiser
        random_coordinates = @board.cells.keys.sample(@cruiser.length)
        until @board.valid_placment?(@cruiser, random_coordinates)
            random_coordinates = @board.cells.keys.sample(@cruiser.length)
        end
        @board.place(@cruiser, random_coordinates)

    end
end