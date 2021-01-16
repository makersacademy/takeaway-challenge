require 'takeaway'
require 'menu'
require 'order'


describe Takeaway do

  subject { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, see_menu: print_menu) }
  let(:print_menu) {  "burger = £7, hamburger = £7, chips = £2" }
  let(:dishes) { { burger: 2, hamburger: 1,} }
  let(:order) { double(:order) }




  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:place_order).with(1).argument }


  describe '#view_menu' do
    it 'shows the menu' do
      expect(subject.view_menu).to eq(print_menu)
    end
  end

  describe '#place_order' do

    it 'adds dishes to order' do
      expect(order).to receive(:add).twice
      subject.place_order(dishes)
    end

  end

end
