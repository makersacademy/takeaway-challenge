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

  # describe '#add_name_and_price' do
  #   it 'updates the name and price' do
  #   subject.add_name_and_price("Chips", 2)
  #   expect(subject.name).to eq("Chips")
  #   expect(subject.price).to eq(2)
  #   end
  # end
end
