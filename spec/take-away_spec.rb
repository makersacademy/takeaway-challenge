require 'take-away'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double( :menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { 'Chicken: $3.50'}
  
  let(:dishes) { {chicken: 2, fish: 1} }

  it "shows the menu with dishes and prices" do
  expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
