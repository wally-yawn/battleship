require 'spec_helper'

RSpec.describe Computer_logic do
    before(:each) do
        @board = Board.new
        @computer_logic = Computer_logic.new(board)
    end

    describe 'it exist' do
        expect(@computer_logic.board).to eq(@board)
        expect(@computer_logic.player).to eq(@player)
        expect(@computer_logic.cruiser).to be_an_instance_of(Ship)
        expect(@computer_logic.submarine).to be_an_instance_of(Ship)
        expect(@computer_logic.ships).to be_a Array
    end
end