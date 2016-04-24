require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, display: displayed_menu) }
  let(:order) { double(:order) }
  let(:displayed_menu) {"Arepa: £5.50"}
  let(:dishes) { {arepa: 4, empanada: 5} }


  it "displays menu and prices" do
    expect(takeaway.menu_display).to eq(displayed_menu)
  end

  it "can order dishes available" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end
