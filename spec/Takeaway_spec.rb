require "Takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }


  let(:menu) { double:menu, print: printed_menu }
  let(:order) { instance_double("Order", total: 15.50) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "chicken balls: £3:50" }

  let(:dishes) { {chicken: 1, beef: 2} }

  before do
    allow(order).to receive(:add)
  end

  it "Shows the menu with prices and the dishes" do
    expect(takeaway.print_menu).to eq (printed_menu)
  end

  it "can order a number of avalible dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

    it "knows the order total" do
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

  it 'sends SMS when order placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
