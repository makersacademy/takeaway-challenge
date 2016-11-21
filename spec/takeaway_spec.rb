require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double('Order', total: 27.97) }
  let(:sms) { instance_double("SMS", send_text: nil) }
  let(:printed_menu) { "Hawaiian: £9.99" }

  let(:dishes) {  {hawaiian: 2, margherita: 1} }

  before do
    allow(order).to receive(:add)
  end
  it 'should show a menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'should be allowed to select several dishes for order' do
    expect(order).to receive(:add).twice
    takeaway.order_takeaway(dishes)
  end

  it 'should know the order total' do
    allow(order).to receive(:add)
    total = takeaway.order_takeaway(dishes)
    expect(total).to eq(27.97)
  end
  it 'should send an sms when order is place' do
    expect(sms).to receive(:send_text)
    takeaway.order_takeaway(dishes)
  end
end
