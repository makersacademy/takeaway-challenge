# feature test
require 'takeaway'
require 'order'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) } # mock test needs 2 methods - #menu and #order

  let(:menu) { double(:menu, show: displayed_menu) } 
  let(:order) { double(:order, total: 20.00) }
  let(:displayed_menu) { "thing1: £10.00" }
  let(:whiskies) { { thing1: 2, thing2: 1 } }

  describe 'menu' do
  
    it 'displays menu with items and prices' do
      expect(menu.show).to eq(displayed_menu)
    end
  end

  describe 'order' do
    it 'allows user to select any number of different items' do
      expect(order).to receive(:add).twice
      takeaway.place_order(whiskies)
    end

    it 'saves the total' do
      allow(order).to receive(:add)
      total = takeaway.place_order(whiskies)
      expect(total).to eq(20.00)
    end
  end
end
