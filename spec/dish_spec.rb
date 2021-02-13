require 'dish'

describe Dish do
  let(:name) { 'Jalfrezi' }
  let(:price) { 7.99 }
  let(:dish) { described_class.new(name, price) }

  describe '#name' do
    it 'tells us the name of the dish' do
      expect(dish.name).to eq name
    end
  end

  describe '#price' do
    it 'tells us the price of the dish' do
      expect(dish.price).to eq price
    end
  end
  
end
