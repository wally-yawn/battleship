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
end