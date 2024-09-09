require 'spec_helper'
RSpec.describe Board do
    before (:each) do
    @board = Board.new
    end

    describe '#initialize' do
        it 'exists' do
            expect(@board).to be_an_instance_of(Board)
        end
    end
end