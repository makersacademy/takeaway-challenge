require 'dish'

describe Dish do
  subject(:dish) { Dish.new('Chicken Chow mien', '10.00', 'main') }
  context 'create a new dish' do
    it 'name' do
      expect(dish.name).to eq('Chicken Chow mien')
    end

    it 'price' do
      expect(dish.price).to eq('10.00')
    end

    it 'course' do
      expect(dish.course).to eq('main')
    end
  end
end
