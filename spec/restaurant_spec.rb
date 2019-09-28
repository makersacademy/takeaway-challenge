require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Hamburger £5" }

  it "shows the menu items" do
    expect(restaurant.print_menu).to eq printed_menu
  end

end
