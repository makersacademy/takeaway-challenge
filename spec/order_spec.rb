require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:dish1) { double :dish, name: 'pizza', price: 5 }
  let(:dish2) { double :dish, name: 'pasta', price: 4 }
  let(:dish3) { double :dish, name: 'chicken', price: 7 }

  let(:menu) { double :menu }

  context '#take_order' do
    it 'takes order from customer' do
      order.add(dish1, 1)
      expect(order.summary).to eq({ { name: 'pizza', price: 5 } => 1 })
    end

    it 'selects several dishes' do
      order.add(dish1, 1)
      order.add(dish2, 1)
      expect(order.summary).to eq({ { name: 'pizza', price: 5 } => 1, { name: 'pasta', price: 4 } => 1 })
    end
  end

  it 'selects the same dish' do
    order.add(dish1, 1)
    order.add(dish1, 1)
    expect(order.summary).to eq({ { name: 'pizza', price: 5 } => 2 })
  end
end
