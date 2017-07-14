require 'dish'

describe Dish do
  let(:name) { 'Cheeseburger' }
  let(:price) { 42 }
  subject(:dish) { described_class.new(name: name, price: price) }

  describe '#name' do
    it 'is expected to return name' do
      expect(dish.name).to eq name
    end
  end

  describe '#price' do
    it 'is expected to return price' do
      expect(dish.price).to eq price
    end
  end
end
