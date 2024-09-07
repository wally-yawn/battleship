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
        if @ship == nil
            @ship = ship
        else
            'cell is taken'
        end
    end
    
    def fired_upon?
        @hit
    end

    def fire_upon
        if fired_upon? == false
            @hit = true
            if @ship != nil
                @ship.hit
            end
        else
            "already fired upon"
        end
    end

    def render(reveal = false)
        # Needs more testing to make sure reveal works properal
        # Possible will need work in interation 2
        if @hit == false
            '.'
        elsif @ship == nil
            'M'
        elsif @ship.sunk? != true
            "H"
        else
            'X'
        end
    end
end