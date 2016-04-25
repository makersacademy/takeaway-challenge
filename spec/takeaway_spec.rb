require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config:{}) }

  let(:menu) { double(:menu, display: displayed_menu) }
  let(:order) { double(:order, total: 15.50) }
  let(:displayed_menu) { "Arepa: £5.50" }
  let(:sms) { double :sms, deliver: nil }
  let(:dishes) { { arepa: 2, empanada: 4 } }


  it "displays menu and prices" do
    expect(takeaway.menu_display).to eq(displayed_menu)
  end

  before do
    allow(order).to receive(:add)
  end

  it "can order dishes available" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "totals amount for the order" do
  total = takeaway.place_order(dishes)
  expect(total).to eq (15.50)
  end

  it "sends SMS when order is placed" do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end


end
