# feature test
require 'takeaway'
require 'order'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) } # mock test needs 2 methods - #menu and #order

  let(:menu)  { double(:menu, show: displayed_menu) }
  let(:order) { double(:order) }
  let(:displayed_menu) { "yum: £10.00" }
  let(:whiskies) { {yum: 2, hibiki: 1} }

 describe 'menu' do
  
  it 'displays menu with items and prices' do
    expect(menu.show).to eq(displayed_menu)
  end
 end

 describe 'order' do
  it 'allows user to select any number of different items' do
    allow(order).to receive(:add).twice
    takeaway.place_order(whiskies)
  end

  it 'calculates the total of the order' do
    total = takeaway.place_order(whiskies)
  end
 end
end
