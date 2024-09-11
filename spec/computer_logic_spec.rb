require 'spec_helper'


RSpec.describe Computer_logic do
    before(:each) do
        @board = Board.new
        @computer_logic = Computer_logic.new(@board)
    end

    describe '#initialize' do
        it 'exist' do
            expect(@computer_logic.board).to eq(@board)
            expect(@computer_logic.cruiser).to be_an_instance_of(Ship)
            expect(@computer_logic.submarine).to be_an_instance_of(Ship)
            expect(@computer_logic.ships).to be_a Array
        end
    end

    describe '#place_ship' do
        it 'can place both ships on a valid set of coordinates' do
            @computer_logic.place_ship
            
            occupied_cells = @board.cells.find_all do |coordinate, cell|
                cell.empty? == false
            end

            expect(occupied_cells.length).to eq(5)
        end
    end

    describe '#enter_shot_coordinate' do
        before(:each) do
            @ship = Ship.new("Battleship", 4)
            @board.place(@ship, ['A1', 'A2', 'A3', 'A4'])
        end

        it 'can fire on an unfired-upon coordinate with no ship' do
            expect(@board.cells['B1'].fired_upon?).to eq(false)
            expect(@ship.health).to eq(4)
            expect(@computer_logic.enter_shot_coordinate(@board, 'B1')).to eq(true)
            expect(@board.cells['B1'].fired_upon?).to eq(true)
            expect(@ship.health).to eq(4)
        end

        it 'can fire on an unfired-upon coordinate with a ship' do
            expect(@board.cells['A1'].fired_upon?).to eq(false)
            expect(@ship.health).to eq(4)
            expect(@computer_logic.enter_shot_coordinate(@board, 'A1')).to eq(true)
            expect(@board.cells['A1'].fired_upon?).to eq(true)
            expect(@ship.health).to eq(3)
        end

        it 'cannot fire on a fired-upon coordinate' do
            expect(@board.cells['A1'].fired_upon?).to eq(false)
            expect(@ship.health).to eq(4)
            expect(@computer_logic.enter_shot_coordinate(@board, 'A1')).to eq(true)
            expect(@board.cells['A1'].fired_upon?).to eq(true)
            expect(@ship.health).to eq(3)
            expect(@computer_logic.enter_shot_coordinate(@board, 'A1')).to eq(false)
            expect(@board.cells['A1'].fired_upon?).to eq(true)
            expect(@ship.health).to eq(3)
        end
    end
end