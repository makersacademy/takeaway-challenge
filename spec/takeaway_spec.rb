require 'Takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double :menu, print: printed_menu }
  let(:order) { instance_double("Order", total: 10.00) }
  let(:printed_menu) { "Menu List"}

  let(:dishes) { {chicken: 3, fries: 2} }

  it 'shows a menu of dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'selects a number of available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(10.00)
  end
end
