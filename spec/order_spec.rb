require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:dish) { double :dish, name: 'pizza', price: 5 }
  let(:menu) { double :menu }

  context '#take_order' do
    it 'takes order from customer' do
      order.add(dish, 1)
      expect(order.summary).to eq([{name: 'pizza', price: 5, quantity: 1}])
    end
  end
end
