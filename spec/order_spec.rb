require 'order'

describe Order do
  subject(:order) { Order.new }

  let(:dish){ double(:dish, price: 1)}

  context '#initialize' do
    it 'sets @list to an empty array' do
      expect(subject.list).to be_empty
    end
  end

  context '#add' do
    it 'adds the dish and quantity to @list' do
      quantity = 3
      order.add(dish, quantity)
      expect(order.list).to eq [{dish: dish, quantity: 3 }]
    end
  end

  context '#total' do
    it 'returns the total value of @list' do
      quantity = 3
      2.times { order.add(dish, quantity) }
      expect(order.total).to eq (2 * 3 * 1)
    end
  end

end
