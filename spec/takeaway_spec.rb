require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order, sms:sms, config: {}) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 14.00) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Lamb: £4.50" }

  let(:dishes) { {Lamb: 4, Chicken: 3} }

  before do
    allow(order).to receive(:add)
  end

  it 'Shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'Can select some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'Knows the total for the order' do
    total = takeaway.place_order(dishes)
    expect(total).to eq(14.00)
  end

  it 'Sends a text when order is placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
