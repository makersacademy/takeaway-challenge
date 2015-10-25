require 'order'

describe Order do
  subject(:order){ Order.new }

  let(:name){ 'Burger' }
  let(:price){ 4.99 }
  let(:dish){ double('dish', name: name, price: price) }

  context '#initialize' do
    it 'defaults @list to an empty array' do
      expect(order.list).to be_empty
    end
  end

  context '#add' do
    it 'adds an item to the order' do
      quantity = 1
      order.add(dish, quantity)
      expect(order.list).to eq [{dish: dish, quantity: quantity}]
    end
  end

  context '#total' do
    it 'returns zero for an empty order' do
      expect(order.total).to eq 0
    end
    it 'returns the total value of an order' do
      quantity = 2
      order.add(dish, quantity)
      expect(order.total).to eq price * 2
    end
  end
end
