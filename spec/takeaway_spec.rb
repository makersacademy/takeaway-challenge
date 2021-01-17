require 'takeaway'
require 'menu'
require 'order'


describe Takeaway do

  subject { described_class.new(menu: Menu.new, order: Order.new) }

  let(:menu) { double(:menu, see_menu: print_menu) }
  let(:print_menu) {  "burger = £7, hamburger = £7, chips = £2" }
  let(:dishes) { { burger: 2, hamburger: 1,} }
  let(:order) { double(:order, total: 21) }

  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:place_order).with(1).argument }

  describe '#view_menu' do
    it 'shows the menu' do
      expect(subject.view_menu).to eq(print_menu)
    end
  end

  describe '#place_order' do
    it 'adds dishes to order' do
      expect(subject.place_order(dishes)).to eq(dishes)
    end
  end

  describe '#order_amount' do
    it 'returns the order total in pounds' do
      subject.place_order(dishes)
      expect(subject.order_amount).to eq("£21")
    end
  end

end
