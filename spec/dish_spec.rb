require 'dish'

describe Dish do
  subject(:dish) {described_class.new}
  before do
    dish[:name] = 'Chow Mein'
    dish[:price] = 3.99
  end
  context '#initialize' do
    it 'has a dish name' do
      expect(dish.name).to eq 'Chow Mein'
    end

    it 'has a price' do
      expect(dish.price).to be(3.99)
    end
  end
end
