require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) {double(:order)}

  let(:printed_menu) { "soup, £3.50" }
  let(:dishes) { {soup: 2, pie: 3} }

  describe '#display_menu' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.display_menu).to eq(printed_menu)
    end
  end

  describe '#select_dishes' do
    it 'select some number of several available dishes' do
      expect(order).to receive(:add).twice
      takeaway.select_dishes(dishes)
    end
  end

end
