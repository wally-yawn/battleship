require 'spec_helper'

RSpec.describe Turn do
    before (:each) do
        @turn = Turn.new
    end

    it 'exist' do
        expect(@turn).to be_a(Turn)
    end
end