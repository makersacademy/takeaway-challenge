require 'byebug'
require 'dish'

describe Dish do

  subject(:dish) { described_class.new(food_item, price, available) }
  let(:food_item) { double(:dish_item) }
  let(:price) { double(:price) }
  let(:available) { double(:available) }

  context 'when initializing a new dish' do
    it 'has a name' do
      expect(dish.name).to eq food_item
    end
    it 'has a price' do
      expect(dish.price).to eq price
    end
    it 'has availability boolean' do
      expect(dish.available).to eq true
    end
  end
end
