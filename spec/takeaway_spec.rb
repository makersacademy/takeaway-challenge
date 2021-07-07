require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Burger: £9.50" }
  let(:order) { double(:order) }

  let(:dishes) { {burger: 9, falafel: 8}}

  it 'shows menu with the dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).twice
    subject.place_order(dishes)
  end
end
