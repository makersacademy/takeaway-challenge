require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu, config: {}, order: order, sms: sms) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Hamburger £5" }

  let(:order) { double(:order, order_total: 24) }
  let(:items) { { cheeseburger: 3, hamburger: 1, fries: 3 } }

  let(:sms) { double(:sms, deliver: nil) }

  it "shows the menu items" do
    expect(restaurant.print_menu).to eq printed_menu
  end

  it "can add menu selections when placing an order" do
    expect(order).to receive(:add).thrice
    restaurant.place_order(items)
  end

  it " shows the order total" do
    allow(order).to receive(:add)
    order_total = restaurant.place_order(items)
    expect(order_total).to eq 24.00
  end

  it "sends a confirmation text that the order has been placed" do
    allow(order).to receive(:add)
    expect(sms).to receive(:deliver)
    expect(restaurant.place_order(items))
  end

end
