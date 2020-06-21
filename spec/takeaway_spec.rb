require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu)}
  let(:order) { double(:order) }
  let(:printed_menu) { "Chicken fried rice: £3.50" }

  let(:dishes) {{Chicken: 2, fish: 1}}

  it 'shows menu with dishes with prices' do
    expect(takeaway.list_menu).to eq(printed_menu)
  end

  it 'can order some number of avalible dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end