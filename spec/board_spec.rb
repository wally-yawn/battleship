require 'spec_helper'
RSpec.describe Board do
    before (:each) do
    @board = Board.new
    end

    it 'exist' do
        expect(@board).to eq(Board)
    end
end