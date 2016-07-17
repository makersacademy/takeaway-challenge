require "restaurant"
require "order"

describe Restaurant do

  let(:restaurant) {described_class.new(menu: menu, order: order)}
  let(:order) {double(:order)}
  let(:menu) { double(:menu, print_m: printed_menu) }
  let(:printed_menu) { "Fish: $5.00" }

  let(:dishes_to_order) do
    {
      chicken: 1,
      fish: 2
    }
  end

    it "can print a menu with a list of dishes and prices" do
      expect(restaurant.print_menu).to eq(printed_menu)
    end

    it "can order several quantities of the available dishes" do
      expect(order).to receive(:add).twice
      restaurant.place_order(dishes_to_order)
    end



end
