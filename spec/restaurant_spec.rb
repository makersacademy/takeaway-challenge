require 'restaurant'

describe Restaurant do
  subject { described_class.new(menu, order) }
  let(:menu) { instance_double 'Menu' }
  let(:order) { instance_double 'Order'}

  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:select_dish).with(2).arguments }

  describe '#view_menu' do
    it 'returns a menu of dishes with prices' do
      allow(menu).to receive(:print_menu).and_return('Fish & Chips £4')
      expect(subject.view_menu).to eq 'Fish & Chips £4'
    end
  end

  describe '#select_dish' do
    it 'adds a dish to the order' do
      dish = 'Burger'
      qty = 2
      expect(order).to receive(:add_to_basket).with(dish, qty)
      subject.select_dish(dish, qty)
    end
  end
end
