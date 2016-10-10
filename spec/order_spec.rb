require 'order'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new(menu) }

  describe '#add_to_order' do
    it 'adds the dishes to list of items' do
      order.add_to_order('Tiramisu')
      order.add_to_order('Gelato')
      expect(order.items).to include 'Tiramisu', 'Gelato'
    end

    it 'adds the quantities to list of items' do
      order.add_to_order('Tiramisu')
      order.add_to_order('Tiramisu')
      expect(order.items['Tiramisu']).to eq 2
    end

    it 'adds additional quantities to list of items' do
      quantity = 4
      order.add_to_order('Tiramisu', quantity)
      expect(order.items['Tiramisu']).to eq quantity
    end
  end

  describe '#order_total' do
    it 'returns the price of the order' do
      allow(menu).to receive(:dish_price).with('Tiramisu') { 4.5 }
      order.add_to_order('Tiramisu', 2)
      expect(order.order_total).to eq 9.0
    end
  end
end
