=begin
require 'order.rb'

describe Order do

subject(:order) {Order.new}

  describe 'initialize' do
    it 'creates an instance of Order' do
      expect(order).to be_a(Order)
    end
    it 'has a total' do
      expect(order.total).to eq(0)
    end
    it 'has dishes as an order' do
      expect(order.order).to eq([])
    end
  end

  describe '#add_to_order' do
    noodles = Dish.new('noodles', 5)
    dumplings = Dish.new('dumplings', 3)
    it 'adds the name of dishes passed as arguments' do
      expect(order.add_to_order(dumplings)).to eq(['Dumplings'])
      expect(order.add_to_order(noodles)).to eq(['Dumplings', 'Noodles'])
    end
  end

  describe '#show_order' do
    it 'shows an empty order' do
      expect(order.show_order).to eq(nil)
    end
    noodles = Dish.new('noodles', 5)
    dumplings = Dish.new('dumplings', 3)
    order.add_to_order(dumplings)
    order.add_to_order(noodles)
    it 'shows an order' do
      expect(order.show_order).to eq("1 Dumplings")
    end
  end

end
=end
