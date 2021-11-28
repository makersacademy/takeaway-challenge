require 'dish'

describe Dish do

    before do
        @dish = Dish.new("pizza", 8)
    end

    context 'makes a dish with a name and a price' do

        it 'checks that a new dish has a name' do
            expect(@dish.name).to eq "pizza"
        end
        
        it 'checks that a new dish has a price' do
            expect(@dish.price).to eq 8
        end
    end

end