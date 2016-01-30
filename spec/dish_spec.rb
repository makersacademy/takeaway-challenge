require 'dish'

describe Dish do
  subject(:dish) {described_class.new}
  context '#initialize' do
    before do
      dish[:name] = 'Chow Mein'
      dish[:price] = 3.99
      dish[:selected] = false
    end
    it 'has a dish name' do
      expect(dish.name).to eq 'Chow Mein'
    end

    it 'has a price' do
      expect(dish.price).to be(3.99)
    end

    it 'has a selected status' do
      expect(dish.selected).to be_falsey
    end
  end
end
