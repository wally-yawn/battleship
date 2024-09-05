require 'spec_helper'
RSpec.describe Cell do
    before(:each) do
    @cell = Cell.new("B4")
end

    describe '#initialize' do
        it '#exist' do
            expect(@cell).to be_an_instance_of(Cell)
            expect(@cell.coordinate).to eq("B4")
            expect(@cell.ship).to be(nil)
        end
    end

    describe '#empty?' do
        it 'returns true when no ship is placed' do
            expect(@cell.empty?).to eq (true)
        end
    end
end