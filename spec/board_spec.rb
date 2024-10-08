require 'spec_helper'

RSpec.describe Board do
    before (:each) do
        @board = Board.new
    end

    it 'exist' do
        expect(@board).to be_a(Board)
    end

    it 'has cells inside of a hash' do
        expect(@board.cells).to be_a(Hash)
    end

    describe '#valid_coordinate checker' do
        it 'has a total of 16 key/value pairs in the hash' do
            expect(@board.cells.size).to eq(16)
        end

        it 'is a valid coordinate' do
            expect(@board.valid_coordinate?("A1")).to eq(true)
            expect(@board.valid_coordinate?("D4")).to eq(true)
            expect(@board.valid_coordinate?("A5")).to eq(false)
            expect(@board.valid_coordinate?("E1")).to eq(false)
            expect(@board.valid_coordinate?("A22")).to eq(false)
        end
    end

    describe '#length_checker/placement checker' do
        it 'has a valid length/valid placement' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2) 

            expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
            expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
            expect(@board.valid_placement?(submarine, ["A2"])).to eq(false)
        end
    end

    describe '#consecutive checker' do
        it 'checks for consecutive' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2) 

            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq (false)
            expect(@board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
            expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
            expect(@board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
            expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
            expect(@board.valid_placement?(cruiser, ["A1", "A2", "B3"])).to eq(false)
            expect(@board.valid_placement?(submarine, ["B1", "C1"])).to eq(true)
        end
    end

    describe '#diagonal_checker' do
        it 'checks if a ship is trying to be placed diagonally' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2) 

            expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq (false)
            expect(@board.valid_placement?(submarine, ["C2", "D3"])).to eq (false)
        end
    end

    describe '#place' do
        it 'can place a valid ship on a valid set of coordinates' do
            cruiser = Ship.new("Cruiser", 3)
            expect(@board.place(cruiser,['A1', 'A2', 'A3'])).to eq(true)
            expect(@board.cells['A1'].ship).to eq(cruiser)
            expect(@board.cells['A2'].ship).to eq(cruiser)
            expect(@board.cells['A3'].ship).to eq(cruiser)
            expect(@board.cells['A4'].ship).to eq(nil)
        end

        it 'cannot place a valid ship on an invalid set of coordinates' do
            cruiser = Ship.new("Cruiser", 3)
            expect(@board.place(cruiser,['A1', 'A2', 'A4'])).to eq(false)
            expect(@board.cells['A1'].ship).to eq(nil)
            expect(@board.cells['A2'].ship).to eq(nil)
            expect(@board.cells['A3'].ship).to eq(nil)
            expect(@board.cells['A4'].ship).to eq(nil)
        end

        it 'cannot place a valid ship on an occupied cell' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2) 
            @board.place(cruiser,['A1', 'A2', 'A3'])
            expect(@board.place(submarine,['A3', 'A4'])).to eq(false)
            expect(@board.cells['A1'].ship).to eq(cruiser)
            expect(@board.cells['A2'].ship).to eq(cruiser)
            expect(@board.cells['A3'].ship).to eq(cruiser)
            expect(@board.cells['A4'].ship).to eq(nil)
        end
    end

    describe '#render' do
        before(:each) do
            @cruiser = Ship.new("Cruiser", 3)
            @submarine = Ship.new("Submarine", 2) 
        end

        it 'displays the board when no ships have been placed' do
            expect(@board.render).to eq("  1 2 3 4 \n" +
                "A . . . . \n" +
                "B . . . . \n" +
                "C . . . . \n" +
                "D . . . . \n")
        end

        it 'displays the board when ships have been placed' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            expect(@board.render).to eq("  1 2 3 4 \n" +
            "A . . . . \n" +
            "B . . . . \n" +
            "C . . . . \n" +
            "D . . . . \n")
        end

        it 'displays the board when ships have been placed and reveal is set to true' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            expect(@board.render(true)).to eq("  1 2 3 4 \n" +
            "A S S S . \n" +
            "B . . . . \n" +
            "C . . . . \n" +
            "D . . . . \n")
        end
        
        it 'displays the board if there has been a miss' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            @board.cells['B1'].fire_upon
            expect(@board.render).to eq("  1 2 3 4 \n" +
            "A . . . . \n" +
            "B M . . . \n" +
            "C . . . . \n" +
            "D . . . . \n")
        end

        it 'displays the board if there has been a miss and reveal is set to true' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            @board.cells['B1'].fire_upon
            expect(@board.render(true)).to eq("  1 2 3 4 \n" +
            "A S S S . \n" +
            "B M . . . \n" +
            "C . . . . \n" +
            "D . . . . \n")
        end

        it 'displays the board when there has been a hit' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            @board.cells['B1'].fire_upon
            @board.cells['A2'].fire_upon
            expect(@board.render).to eq("  1 2 3 4 \n" +
            "A . H . . \n" +
            "B M . . . \n" +
            "C . . . . \n" +
            "D . . . . \n")
        end

        it 'displays the board when there has been a hit and reveal is set to true' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            @board.cells['B1'].fire_upon
            @board.cells['A2'].fire_upon
            expect(@board.render(true)).to eq("  1 2 3 4 \n" +
            "A S H S . \n" +
            "B M . . . \n" +
            "C . . . . \n" +
            "D . . . . \n")
        end

        it 'displays the board when there is a sunken ship' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            @board.place(@submarine, ["C4", "D4"])
            @board.cells['A1'].fire_upon
            @board.cells['A2'].fire_upon
            @board.cells['A3'].fire_upon
            expect(@board.render).to eq("  1 2 3 4 \n" +
            "A X X X . \n" +
            "B . . . . \n" +
            "C . . . . \n" +
            "D . . . . \n")
        end

        it 'displays the board when there is a sunken ship and reveal is set to true' do
            @board.place(@cruiser, ["A1", "A2", "A3"])
            @board.place(@submarine, ["C4", "D4"])
            @board.cells['A1'].fire_upon
            @board.cells['A2'].fire_upon
            @board.cells['A3'].fire_upon
            expect(@board.render(true)).to eq("  1 2 3 4 \n" +
            "A X X X . \n" +
            "B . . . . \n" +
            "C . . . S \n" +
            "D . . . S \n")
        end
    end
end