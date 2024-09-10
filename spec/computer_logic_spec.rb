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

    describe '#place' do
        it 'can place both ships on a valid set of coordinates' do
            @computer_logic.place_ship
            puts @board.render(true)
            #expect count of cells.empty? to be 11
            #expect(true).to eq(false)
        end
    end
end