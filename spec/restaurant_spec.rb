require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Hamburger £5" }

  let(:order) { double(:order) }
  let(:items) { { cheeseburger: 3, hamburger: 1, fries: 3 } }

  it "shows the menu items" do
    expect(restaurant.print_menu).to eq printed_menu
  end

  it "can add menu selections when placing an order" do
    expect(order).to receive(:add).thrice
    restaurant.place_order(items)
  end

end
