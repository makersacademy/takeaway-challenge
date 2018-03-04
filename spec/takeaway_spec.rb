require 'takeaway'
describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "pasta: £4.30" }
  let(:order) { double(:order, total: 15.50) }
  let(:dishes) { { pizza: 2, pasta: 1 } }
  let(:sms) { instance_double("SMS", deliver: nil) }

  before do
    allow(order).to receive(:add)
  end

  it 'shows the menu with the dishes and pices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number of several available dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

  it 'send an SMS when the order has been placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end
