require 'Takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }

  let(:menu) { double :menu, print: printed_menu }
  let(:order) { instance_double("Order", total: 10.00) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Menu List" }

  let(:dishes) { { chicken: 3, fries: 2 } }

  before do
    allow(order).to receive(:add)
  end

  it 'shows a menu of dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'selects a number of available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do
    total = takeaway.place_order(dishes)
    expect(total).to eq(10.00)
  end

  it 'sends an SMS when the order has been placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
