require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { "Lamb: £4.50" }

  let(:dishes) { {Lamb: 4, Chicken: 3} }

  it 'Shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'Can select some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
