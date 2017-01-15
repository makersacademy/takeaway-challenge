require 'takeaway'


describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }
  let(:menu) { double(:menu, show_menu: print_menu) }
  let(:print_menu) { "Spring rolls £1.50" }
  let(:order) { instance_double("Order", total: 15.50) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:dishes) {{chicken: 2, fish:1}}

  before do
    allow(order).to receive(:add)
  end

  it "shows the list of dishes with prices" do
    expect(takeaway.list_dishes).to eq(print_menu)
  end

  it "can order any number of available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

  it "sends an SMS when the order has been placed" do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end
