require 'order'
require 'dish'
describe Order do
  let(:order) { described_class.new }
  let(:dish) { double :dish, name: "Pizza", price: 5.00 }
  describe '#add_dish' do

    it '#adds a dish to the order' do
      orders = order.items
      expect{ order.add_dish(dish) }.to change { orders.count }.by(1)
    end
  end

  describe '#total' do

    it 'displays the total cost of the items ordered' do
      order.add_dish(dish)
      expect(order.total).to eq(5.00)
    end
  end

end
