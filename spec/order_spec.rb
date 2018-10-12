require 'order'

describe Order do
  describe '#add_dish' do

    it 'starts with an empty basket' do
      order = Order.new

      expect(order.basket).to eq []
    end

    it 'adds a dish with price to the basket' do
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

    it 'shows total price of zero dishes order' do
      order = Order.new

      expect(order.total).to eq 0
    end

    it 'shows total price of one dish order' do
      order = Order.new

      order.add_dish("chicken soup", 5)

      expect(order.total).to eq 5
    end

    it 'shows total price of dishes' do
      order = Order.new

      order.add_dish("chicken soup", 5)
      order.add_dish("pizza", 2.30)
      order.add_dish("chicken soup", 5)

      expect(order.total).to eq 12.30
    end

    describe '#show_basket' do
      it 'shows a message "Empty basket", if no dishes are added' do
        order = Order.new
        expect { order.show_basket } .to raise_error("Empty basket")
      end
    end
  end
end
