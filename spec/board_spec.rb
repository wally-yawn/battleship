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
            expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
            expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
        end
    end

    #oard.valid_placement?(cruiser, ["A1", "A2"])
    #board.valid_placement?(submarine, ["A2", "A3", "A4"])
end