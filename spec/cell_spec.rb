require 'spec_helper'
RSpec.describe Cell do
    before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
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
            expect(@cell.empty?).to eq(true)
        end
    end

    describe '#place_ship' do
        it 'can place ships' do
            expect(@cell.empty?).to eq(true)
            @cell.place_ship(@cruiser)
            expect(@cell.empty?).to eq(false)
        end
    end
end