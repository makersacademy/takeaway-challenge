require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new}
  let(:printer_module) {double (:printer_module) }
  let(:order_class) {double (:order_class)}

  it "exists" do
    expect(Restaurant).to receive(:new)
    Restaurant.new
  end
  it "contains a list of dishes and prices" do
    expect(restaurant.menu[:trout_snout]).to eq(6.50)
    expect(restaurant.menu[:mysterious_dumpling]).to eq(8.00)
    expect(restaurant.menu[:hoof_broth]).to eq(3.30)
    expect(restaurant.menu).to eq({
      trout_snout: 6.50,
      hog_soup: 4.90,
      mysterious_dumpling: 8.00,
      boring_sandwich: 4.00,
      cuttlefish_pate: 11.00,
      hoof_broth: 3.30
    })
  end
  it "passes the menu to printer" do
    expect(printer_module).to receive(:menu_printer)
    restaurant.print_menu(printer_module)
  end
  it "creates a new instance of the order class when user tries to place an order" do
    expect(order_class).to receive(:new)
    restaurant.place_order(order_class)
  end

end
