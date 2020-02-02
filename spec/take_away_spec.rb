require 'take_away'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }
  # adding double:
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 15.50) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { 'Sausage: £5' }

  let(:dishes) { { sausage: 2, chips: 1 } }

  before do
    allow(order).to receive(:add)
  end

  it "Shows the menu with list of dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
  it 'can order some number of several dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
  # mocking
  it 'Knows the order total' do
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end
  
  it "send an SMS when the order has been placed" do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
