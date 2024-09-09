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
            expect(board.valid_coordinate?("A1")).to eq(true)
            expect(board.valid_coordinate?("D4")).to eq(true)
            expect(board.valid_coordinate?("A5")).to eq(false)
            expect(board.valid_coordinate?("E1")).to eq(false)
            expect(board.valid_coordinate?("A22")).to eq(false)
        end
    end

    describe '#length_checker/placement checker' do
        it 'has a valid length/valid placement' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2) 

            expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
            expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        end
    end

    describe '#consecutive checker' do
        it 'checks for consecutive' do
            cruiser = Ship.new("Cruiser", 3)
            submarine = Ship.new("Submarine", 2) 

            expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq (false)
            expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
            expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
            expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
        end
    end
end