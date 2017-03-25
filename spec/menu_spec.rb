require 'menu'

describe Menu do
subject(:menu) { described_class.new }

let(:order) { double :order }
let(:order_class) { double :order_class, new: order }
let(:item) { double :item }
let(:price) {double :price }
# let(:an_item) { double :an_item, :item => item, :price => price }

it { is_expected.to respond_to(:open) }
it { is_expected.to respond_to(:select_item).with(1).argument }

  describe '#select_item' do
    it 'selects a menu item by item_number' do
      menu.create_new_order
      expect(menu.new_order).to receive(:add_item).with(anything)
      menu.select_item(0)
    end
  end


end
