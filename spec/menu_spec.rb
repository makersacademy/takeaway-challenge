require 'menu'

describe Menu do
subject(:menu) { described_class.new }

let(:order) { double :order }
let(:order_class) { double :order_class, new: order }
let(:item) { double :item }
let(:price) {double :price }
let(:an_item) { double :an_item, :item => item, :price => price }

it { is_expected.to respond_to(:open) }
it { is_expected.to respond_to(:create_new_order) }
it { is_expected.to respond_to(:select_item).with(1).argument }
it { is_expected.to respond_to(:remove_item).with(1).argument }
it { is_expected.to respond_to(:review_order) }
it { is_expected.to respond_to(:confirm_order) }

  describe '#select_item' do
    it 'selects a menu item by item_number' do
      menu.create_new_order
      expect(menu.new_order).to receive(:add_item).with(anything)
      menu.select_item(0)
    end
  end

  describe '#remove_item' do
    it 'removes a basket item by item_number' do
      menu.create_new_order
      menu.select_item(1)
      expect(menu.new_order).to receive(:delete_item).with(anything)
      menu.remove_item(0)
    end
  end

  xdescribe '#review_order' do
    it 'shows current basket' do
      # allow(:order).to receive(:add_item).and_return(an_item)
      menu.create_new_order
      menu.select_item(an_item)
      expect(menu.new_order).to receive(:show_basket)
      menu.review_order
    end
  end



end
