require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish, :name => 'steamed pork dumpling', :price => 1.50 }

  describe '#select_dish' do
    it 'should add a dish to the order' do
      order.select_dish(dish, 1)
      expect(order.dishes).to include(dish: dish, quantity: 1)
    end
  end

  describe '#total' do
    it 'should = 0 with no dishes ordered' do
      expect(order.total).to be_zero
    end
    it 'should give the price of a single item' do
      order.select_dish(dish, 1)
      expect(order.total).to eq 1.50
    end
    it 'should give the price of multiple items' do
      order.select_dish(dish, 1) # £1.50
      order.select_dish(dish, 3) # £4.50
      expect(order.total).to eq 6 # £6.00
    end
  end
end
