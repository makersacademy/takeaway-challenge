require 'dish'

describe Dish do
  subject(:dish) { Dish.new('Chicken Chow mien', '10.00', true) }
  context 'create a new dish' do
    it 'name' do
      expect(dish.name).to eq('Chicken Chow mien')
    end

    it 'price' do
      expect(dish.price).to eq('10.00')
    end

    it 'available' do
      expect(dish.available).to be true
    end
  end

  describe '#pretty_format' do
    it 'print to output format' do
      expect(dish.pretty_format).to eq('Chicken Chow mien £10.00')
    end
  end
end
