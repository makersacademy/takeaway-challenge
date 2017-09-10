require 'order'

describe Order do
  let(:menu) { double(:menu, list: [{ name: "Green Curry", description: "Chicken", price: 10 }]) }
  subject(:order) { described_class.new(menu) }

  it { is_expected.to respond_to(:add_dish).with(2).argument }
  it { is_expected.to respond_to(:remove_dish).with(1).argument }
  it { is_expected.to respond_to(:order_total) }
  it { is_expected.to respond_to(:finalize_order) }

  describe '#add_dish' do
    it 'adds a dish to the order list' do
      order.add_dish("Green Curry", 1)
      expect(order.items).to eq [{ name: "Green Curry", description: "Chicken", price: 10, quantity: 1 }]
    end
  end

  describe '#remove_dish' do
    it 'deletes dish from the order list' do
      order.add_dish("Green Curry", 2)
      order.remove_dish("Green Curry", 1)
      expect(order.items).to eq [{ name: "Green Curry", description: "Chicken", price: 10, quantity: 1 }]
    end
  end

  describe '#order_total' do
    it 'gives the order total' do
      order.add_dish("Green Curry", 1)
      expect(order.order_total).to eq 10
    end
  end

end
