require 'dish'

describe Dish do
  context 'So dish lists name and price' do
    it 'dish initialized with a name' do
      dish = Dish.new('name', 0)
      expect(dish.name).to eq 'name'
    end

    it 'dish initialized with a price' do
      dish = Dish.new('name', 0)
      expect(dish.price).to eq 0
    end
  end
end
