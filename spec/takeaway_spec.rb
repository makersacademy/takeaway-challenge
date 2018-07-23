# feature test
require 'takeaway'
require 'order'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) } # mock test needs 2 methods - #menu and #order

  let(:menu)  { double(:menu, show: displayed_menu) } 
  let(:order) { double(:order, total: 120.00) }
  let(:sms)   { double(:sms, deliver: nil) }
  let(:displayed_menu) { "Lagavulin_16yo_Islay: £49.50" }
  let(:whiskies) { { :Lagavulin_16yo_Islay => 2, :Laphroaig_10yo_Islay => 1 } }

  describe 'menu' do
  
    it 'displays menu with items and prices' do
      expect(menu.show).to eq(displayed_menu)
    end
  end

  describe 'order' do

    before do
      allow(order).to receive(:add)
    end
    
    it 'allows user to select any number of different items' do
      expect(order).to receive(:add).twice
      takeaway.place_order(whiskies)
    end

    it 'saves the total' do
      total = takeaway.place_order(whiskies)
      expect(total).to eq(120.00)
    end
  end

  describe 'text notification' do

    it 'sends an order confirmation via SMS' do
      expect(sms).to receive(:deliver)
      takeaway.place_order(whiskies)
    end
  end
end
