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
            expect(@cell.ship).to eq(@cruiser)
        end
        it 'cannot place ships if the cell is already occupied' do
            expect(@cell.empty?).to eq(true)
            @cell.place_ship(@cruiser)
            @submarine = Ship.new("Submarine", 2)
            expect(@cell.empty?).to eq(false)
            @cell.place_ship(@submarine)
            expect(@cell.ship).to eq(@cruiser)
        end
    end

    describe '#fired_upon?' do
        it 'returns false if the cell has not been fired upon' do
            expect(@cell.fired_upon?).to eq(false)
        end
    end

    describe '#fire_upon' do
        it 'sets fired_upon to true and calls ship.hit if the cell has been fired upon and there is a ship' do
            expect(@cell.fired_upon?).to eq(false)
            expect(@cruiser.health).to eq(3)
            @cell.place_ship(@cruiser)
            @cell.fire_upon
            expect(@cell.fired_upon?).to eq(true)
            expect(@cruiser.health).to eq(2)
        end

        it 'sets fired_upon to true if the cell has been fired upon and there is no ship' do
            expect(@cell.fired_upon?).to eq(false)
            expect(@cruiser.health).to eq(3)
            @cell.fire_upon
            expect(@cell.fired_upon?).to eq(true)
            expect(@cruiser.health).to eq(3)
        end

        it 'does not allow fire_upon in a cell that has already been fired upon' do
            expect(@cell.fired_upon?).to eq(false)
            @cell.place_ship(@cruiser)
            @cell.fire_upon
            expect(@cell.fired_upon?).to eq(true)
            expect(@cruiser.health).to eq(2)
            @cell.fire_upon
            expect(@cell.fired_upon?).to eq(true)
            expect(@cruiser.health).to eq(2)
        end
    end

    describe '#render' do
        it 'renders . if the cell has not been fired upon and has a ship' do
            @cell.place_ship(@cruiser)
            expect(@cell.render).to eq('.')
        end

        it 'renders . if the cell has not been fired upon and does not have a ship' do
            expect(@cell.render).to eq('.')
        end

        it 'renders “M” if the cell has been fired upon and it does not contain a ship.' do
            @cell.fire_upon
            expect(@cell.render).to eq('M')
        end

        it 'renders “H” if the cell has been fired upon and it contains a ship' do
            @cell.place_ship(@cruiser)
            @cell.fire_upon
            expect(@cell.render).to eq('H')
        end
    
        it 'renders “X” if the cell has been fired upon and its ship has been sunk.' do
            @cell.place_ship(@cruiser)
            @cell.fire_upon
            @cruiser.hit
            @cruiser.hit
            expect(@cell.render).to eq('X')
        end
    end
end