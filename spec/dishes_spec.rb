require 'dishes'

describe Dishes do
    it 'creates an instance of the dishes class' do
        expect(subject).to be_an_instance_of(Dishes)
    end

    it 'has an array of dishes and their prices' do
        expect(subject.dishes_arr).to include({:item=>"Chips", :price=>1.0})
    end
end