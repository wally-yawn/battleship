class Cell

    attr_reader :coordinate, :ship, :hit

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @hit = false
    end

    def empty?
        @ship == nil
    end

    def place_ship(ship)
        @ship = ship
    end
    
    def fired_upon?
        @hit
    end

    def fire_upon
        @hit = true
        if @ship != nil
            @ship.hit
        end
    end
end