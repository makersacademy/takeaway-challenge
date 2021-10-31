require './lib/dish'

describe Dish do
  let(:name) { double :name }
  let(:price) { double :price}

  describe '#name' do
    it 'has a name attribute on initialization' do
      dish = Dish.new(name, price)
      expect(dish.name).to eq(name)
    end
  end

  describe '#price' do
    it 'has a price attribute on initialization' do
      dish = Dish.new(name, price)
      expect(dish.price).to eq(price)
    end
  end
end
