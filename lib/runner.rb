class runner

    def self.start
        @Board = Board.new
        @Computer_logic = Computer_logic.new
        puts "         Welcome to Battleship"
        puts "------------------------------------------"
        puts "Press P to play, Q to quit, C for credits"

        if gets == "P" 
            computer_logic.place


        elsif gets == "Q"
            exit

        else puts "Please enter a valid coordnite for ships"
            
        end
    end
end