require 'order'

describe Order do
  let(:menu) {double :menu, price: '£1.00', contains?: true}
  let(:dish) {double :dish}
  let(:another_dish) {double :another_dish}
  subject(:order) {described_class.new}

  describe '#add_to_order' do
    it { is_expected.to respond_to(:add_to_order).with(2).argument }

    it 'adds the dishes to list of items' do
      allow(dish).to receive(:add_to_order)
      order.add_to_order(dish)
      order.add_to_order(another_dish)
      expect(order.items).to include dish, another_dish
    end

    it 'adds the quantities to list of items' do
      allow(dish).to receive(:add_to_order)
      order.add_to_order(dish)
      order.add_to_order(dish)
      expect(order.items[dish]).to eq 2
    end

    it 'adds additional quantities to list of items' do
      allow(dish).to receive(:add_to_order)
      quantity = 4
      order.add_to_order(dish, quantity)
      expect(order.items[dish]).to eq quantity
    end
  end
end
