require 'dishes'

describe Dishes do
    it 'creates an instance of the dishes class' do
        expect(subject).to be_an_instance_of(Dishes)
    end

    it 'has an array of dishes' do
        expect(subject.dishes_arr).to include("Chips")
    end

    it 'has prices included in the array' do
        expect(subject.dishes_arr).to include("Chips" => 1)
    end

    it 'returns the list of items on the menu' do
        expect(subject.show_menu).to eq(
            "Chips" => 1.00,
            "Burger" => 1.50,
            "Chicken" => 1.50,
            "Kebab" => 3.00
        )
    end

    
end