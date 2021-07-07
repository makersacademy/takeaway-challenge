require 'restaurant.rb'

describe Restaurant do

    it 'is a restaurant' do
    end

    it 'holds a menu' do
        restaurant = Restaurant.new
        expect(subject.menu[1]).to eq 11=>"Massaman Curry"
    end
end