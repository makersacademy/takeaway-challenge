require "restaurant"

describe Restaurant do

  let(:restaurant) {described_class.new(menu: menu)}

  let(:menu) { double(:menu, print_m: printed_menu) }
  let(:printed_menu) { "Fish: $5.00" }

    it "can print a menu with a list of dishes and prices" do
      expect(restaurant.print_menu).to eq(printed_menu)

    end




end
