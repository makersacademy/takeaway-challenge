require 'order_item'

describe OrderItem do
  let(:dish) { double :dish }

  context 'given an item without a quantity' do
    subject(:order_item) { described_class.new(dish) }

    it 'contains an item' do
      expect(order_item.item).to eq dish
    end
    it 'has a default quantity of 1' do
      expect(order_item.quantity).to eq 1
    end
  end

  context 'given a quantity of 2' do
    subject(:order_item) { described_class.new(dish, 2) }

    it 'has a quantity of 2' do
      expect(order_item.quantity).to eq 2
    end
  end

  context 'given an item with price of 5, without a quantity' do
    let(:dish_price_5) { double :dish_price_5, price: 5 }
    it 'has a total cost of 5' do
      order_item_2 = OrderItem.new(dish_price_5)
      expect(order_item_2.cost).to eq 5
    end
  end

  context 'given an item with price of 5 and quantity 2' do
    let(:dish_price_5) { double :dish_price_5, price: 5 }
    it 'has a total cost of 10' do
      order_item_2 = OrderItem.new(dish_price_5, 2)
      expect(order_item_2.cost).to eq 10
    end
  end
end
