require 'order'

describe Order do
  let(:menu) { double :menu, on_menu?: true }
  let(:order) { described_class.new(menu) }
  let(:dish1) { double :dish, name: 'pizza', price: 5 }
  let(:dish2) { double :dish, name: 'pasta', price: 4 }
  let(:dish3) { double :dish, name: 'chicken', price: 7 }

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

    it 'selects the same dish' do
      order.add(dish1, 1)
      order.add(dish1, 1)

      expect(order.summary).to eq({ { name: 'pizza', price: 5 } => 2 })
    end

    it 'raises an error if dish not in menu' do
      allow(menu).to receive(:on_menu?) { false }
      message = 'That dish is not on the menu. Please choose another one!'

      expect { order.add(dish1, 1) }.to raise_error message
    end
  end

  context 'place_order' do
    it 'returns dishes with price and quantity' do
      order.add(dish1, 2)
      order.add(dish2, 1)
      order.add(dish3, 1)

      expect(order.place_order).to eq("Pizza: £5 x 2\nPasta: £4 x 1\nChicken: £7 x 1")
    end
  end
end
