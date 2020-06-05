require 'dish'

RSpec.describe Dish do 
  describe '.name' do
    it 'can store the name of dish' do
      dish = Dish.new('Cheeseburger', 4.99)
      expect(dish.name).to eq('Cheeseburger')
    end
  end

  describe '.price' do
    it 'can store the price of the dish' do
      dish = Dish.new('Cheeseburger', 4.99)
      expect(dish.price).to eq(4.99)
    end
  end
end

