require 'order'

describe Order do
  let(:menu) { double(:menu, list: [{ name: "Green Curry", description: "Chicken", price: 10 }]) }
  subject(:order) { described_class.new(menu) }

  it { is_expected.to respond_to(:add_dish).with(2).argument }
  it { is_expected.to respond_to(:remove_dish).with(1).argument }
  it { is_expected.to respond_to(:order_total) }
  it { is_expected.to respond_to(:finalize_order) }

  describe '#valid_dish?' do
    it 'returns error message if dish is not valid' do
      expect { order.add_dish("Hamburger", 2) }.to raise_error 'Item not found'
    end
  end

end
