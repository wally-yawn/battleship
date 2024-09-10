require './lib/cell'
require './lib/ship'
require './lib/board'

class Computer_logic

    attr_reader :board
    
    def initialize(board)
        @board = board
        @player = player
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
        @ships = [@cruiser, @submarine]
    end

end