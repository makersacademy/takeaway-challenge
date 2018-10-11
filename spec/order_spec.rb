require 'order'

describe Order do
  describe '#add_dish' do

    it 'adds a dish to a basket incl price' do
      order = Order.new

      order.add_dish("chicken soup", 5)

      expect(order.basket).to eq [{ "chicken soup" => 5 }]
    end

    it 'adds multiple dishes to order' do
      order = Order.new

      order.add_dish("chicken soup", 5)
      order.add_dish("pizza", 2.30)

      expect(order.basket).to eq [{ "chicken soup" => 5 }, { "pizza" => 2.30 }]
    end

    it 'adds repeated dishes to order' do
      order = Order.new

      order.add_dish("chicken soup", 5)
      order.add_dish("pizza", 2.30)
      order.add_dish("chicken soup", 5)

      expect(order.basket).to eq [{ "chicken soup" => 5 }, { "pizza" => 2.30 }, { "chicken soup" => 5 }]
    end

  end
end
