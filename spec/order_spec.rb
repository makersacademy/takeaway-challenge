require 'order'

describe Order do
  subject(:order) { described_class.new }
  describe '#items' do
    it 'is created with a blank list of items' do
      expect(order.items).to eq []
    end
  end

  describe '#total' do
    let(:dish) { double :dish, name: 'Steak', price: 25 }
    let(:dish2) { double :dish, name: 'Chips', price: 8 }
    let(:dish3) { double :dish, name: 'Caesar Salad', price: 9 }
    it 'finds the sum of dish prices and returns result' do
      order.items += [dish, dish2, dish3]
      expect(subject.total).to eq(42)
    end
  end
end
