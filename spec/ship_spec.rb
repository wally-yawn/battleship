require 'spec_helper'

RSpec.describe Ship do

    before(:each) do
        @ship = Ship.new("Cruiser",3)
    end

    describe "#initialize" do
        it 'exists' do
            expect(@ship).to be_an_instance_of(Ship)
            expect(@ship.name).to eq("Cruiser")
            expect(@ship.length).to eq(3)
            expect(@ship.health).to eq(3)
        end
  end

    describe "#hit" do
        it 'can hit a ship and lower health' do
            expect(@ship.health).to eq(3)
            @ship.hit
            expect(@ship.health).to eq(2)
        end
    end


    describe "#sunk" do
        it "returns false if the ship health is greater than 0" do
            expect(@ship.health).to eq(3)
            expect(@ship.sunk?).to eq(false)
            @ship.hit
            expect(@ship.health).to eq(2)
            expect(@ship.sunk?).to eq(false)
        end

        it "returns false if the ship health is less than 0" do
            expect(@ship.health).to eq(3)
            expect(@ship.sunk?).to eq(false)
            @ship.hit
            @ship.hit
            @ship.hit
            expect(@ship.health).to eq(0)
            expect(@ship.sunk?).to eq(true)
        end
    end
end