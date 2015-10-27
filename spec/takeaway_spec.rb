require 'takeaway'

describe Takeaway do
  subject(:takeaway) do
    described_class.new(order_klass: order_klass, menu_klass: menu_klass)
  end

  let(:menu_klass) { double(:menu_klass, new: menu) }
  let(:order_klass) { double(:order_klass, new: order) }

  let(:menu) { double(:menu, show: dishes, dishes: dishes)}
  let(:dishes) { {menuitem1: 1, menuitem2: 1.50 } }
  let(:order) { double(:order) }

  describe '#place_order' do

    before do
      allow(takeaway).to receive(:available?).and_return true
      allow(order).to receive(:add).with(:menuitem1, 2).and_return(menuitem1: 2)
      allow(order).to receive(:overview).and_return(menuitem1: 2)
    end

    it 'returns an error when ordering less than 1 item' do
      msg = 'Please order 1 or more items'
      expect(takeaway.place_order('Hamburger', 0)).to eq msg
    end

    it 'returns an error when item not available' do
      msg = 'This item is not on the menu'
      allow(takeaway).to receive(:available?).and_return false
      expect(takeaway.place_order('Hamburger', 25)).to eq msg
    end

    it 'stores name and quantity of dish in basket' do
      takeaway.place_order(:menuitem1, 2)
      expect(takeaway.show_order).to include(menuitem1: 2)
    end
  end
end
