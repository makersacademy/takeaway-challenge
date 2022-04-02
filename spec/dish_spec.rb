require 'dish'

describe Dish do
    dish = Dish.new("Korma", 8)
    it '#name should retun the name of the dish' do
        expect(dish.name).to be_a(String)
    end
    it '#price should return the price of the dish' do
        expect(dish.price).to be_a(Integer)
    end
end