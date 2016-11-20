require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { "Hawaiian: £9.99" }

  let(:dishes) {  {hawaiian: 2, margherita: 1} }

  it 'should show a menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'should be allowed to select several dishes for order' do
    expect(order).to receive(:add).twice
    takeaway.order_takeaway(dishes)
  end
end
