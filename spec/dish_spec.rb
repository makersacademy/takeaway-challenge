require './docs/dish.rb'

describe Dish do
  subject(:dish) { described_class.new(delicious_meal, price, quantity) }
  let(:delicious_meal) { double(:delicious_meal) }
  let(:price) { double(:price) }
  let(:quantity) { double(:quantity) }

  describe 'each dish' do
    it 'should have a name' do
      expect(dish.name).to eq delicious_meal
    end

    it 'should have a price' do
      expect(dish.price).to eq price
    end

    it 'should allow quantity to be chosen' do
      expect(dish.quantity(3)).to eq 3
    end

    it 'should set default quantity to zero' do
      expect(dish.quantity).to eq quantity
    end
  end
end
