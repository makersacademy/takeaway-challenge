# Dish class spec file
require 'dish'
describe Dish do
  subject(:dish) { described_class.new('Fish and Chips', 4.95) }

  describe '#new' do
    it 'should save name and price to @name and @price of dish' do
      expect(dish.name).to eq('Fish and Chips')
      expect(dish.price).to eq(4.95)
    end
  end
end
