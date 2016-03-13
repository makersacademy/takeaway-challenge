require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) {double :dish, price: 3}

  describe '#initialize' do

    it '> should initialize with an empty basket' do
      expect(order.basket).to eq([])
    end

  end

  describe '#add_item' do

    it '> should be able to add some number of an item to the basket' do
      order.add_item(dish)
      expect(order.basket).to eq([dish])
    end

  end

  describe '#calc_total' do

    it '> should calculate the total cost of the orders' do
      order.add_item(dish)
      expect(order.calc_total).to eq(3)
    end
  end

end
