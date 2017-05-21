require 'order'

describe Order do

  let(:menu) { double(:menu, list: [{ name: "Chicken Burguer", description: "Spicy", price: 8 }]) }
  subject(:order) { described_class.new("XY23", menu) }

  it { is_expected.to respond_to(:add_dish).with(2).argument }
  it { is_expected.to respond_to(:remove_dish).with(1).argument }
  it { is_expected.to respond_to(:total) }

  describe '#add_dish' do
    it 'adds a dish to the order list' do
      order.add_dish("Chicken Burguer", 1)
      expect(order.items).to eq [{ name: "Chicken Burguer", description: "Spicy", price: 8, quantity: 1 }]
    end
  end

  describe '#total' do
    it 'gives the order total' do
      order.add_dish("Chicken Burguer", 2)
      expect(order.total).to eq 16
    end

  end

end
