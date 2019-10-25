require 'dishes'

describe Dishes do
    it 'creates an instance of the dishes class' do
        expect(subject).to be_an_instance_of(Dishes)
    end

    it 'has an array of dishes' do
        expect(subject.dishes_arr).to include({"Chips" => 1})
    end

    it 'has prices included in the array' do
        expect(subject.dishes_arr).to include("Chips" => 1)
    end

end