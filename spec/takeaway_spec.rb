require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu)         { double(:menu, show: show_menu) }
  let(:order)        { double(:order) }
  let(:show_menu)    { 'All the dishes' }
  let(:dishes)       { {starter: 2, main: 4} }

  context '#menu' do
    it 'so a customer can see a list of dishes, it has a menu including those dishes' do
      expect(takeaway.show_menu).to eq(show_menu)
    end
  end

  context '#ordering' do
    it 'it can recive an order' do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end


end
