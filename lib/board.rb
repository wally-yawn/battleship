require './lib/cell'
require './lib/ship'

class Board
    attr_reader :cells

    def initialize
        @cells = location
    end

    def location
        loc = {
            "A1" => Cell.new('A1'),
            "A2" => Cell.new('A2'),
            "A3" => Cell.new('A3'),
            "A4" => Cell.new('A4'),
            "B1" => Cell.new('B1'),
            "B2" => Cell.new('B2'),
            "B3" => Cell.new('B3'),
            "B4" => Cell.new('B4'),
            "C1" => Cell.new('C1'),
            "C2" => Cell.new('C2'),
            "C3" => Cell.new('C3'),
            "C4" => Cell.new('C4'),
            "D1" => Cell.new('D1'),
            "D2" => Cell.new('D2'),
            "D3" => Cell.new('D3'),
            "D4" => Cell.new('D4')
        }
    end

    def valid_coordinate?(coordinate)
        if @cells.key?(coordinate)
            true
        else 
            false
        end
    end

    def consecutive_checker(coordinates)
        valid_placement = true
        column = coordinates[0][0]
        row = coordinates[0][1].to_i
        
        if coordinates[1][0] == column
            coordinates.each do |coordinate|
                if coordinate[1].to_i != row || coordinate[0] != column
                    valid_placement = false
                end
                row += 1
            end

        elsif coordinates[1][1].to_i == row
            coordinates.each do |coordinate|
                if coordinate[0] != column || coordinate[1].to_i != row
                    valid_placement = false
                end
                column = column.next
            end

        else valid_placement = false
        end
        valid_placement
    end

    def valid_placement?(ship, coordinates)
        valid_placement = true

        coordinates.each do |coordinate|
            if valid_coordinate?(coordinate) == false 
                valid_placement = false
            end
        end
        if valid_placement == true && ship.length != coordinates.length 
            valid_placement = false
        end
        if valid_placement == true && consecutive_checker(coordinates) == false
            valid_placement = false
        end
        valid_placement
    end

    def occupied?(coordinates)
        occupied = false
        coordinates.each do |coordinate|
            if @cells[coordinate].empty? == false
                occupied = true
            end
        end
        occupied
    end

    def place(ship,coordinates)
        if valid_placement?(ship, coordinates) && occupied?(coordinates) == false
            coordinates.each do |coordinate|
                @cells[coordinate].place_ship(ship)
            end
            true
        else
            false
        end
    end

    def render(reveal = false)
        reveal = reveal
        board = "  1 2 3 4 \n"
        @cells.each do |coordinate, cell|
            if cell.coordinate[1].to_i == 1
                board = board + cell.coordinate[0]
            end
            board = board + " " + cell.render(reveal)
            if cell.coordinate[1].to_i == 4
                board = board + " \n"
            end
        end
        board
    end
end