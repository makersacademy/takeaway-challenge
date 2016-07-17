require "menu"
describe Menu do
  subject(:menu) { described_class.new(dishes)}
  let(:dishes) do { fish: 2.0, chips: 3.5 } end


  it "has a list of items and their prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "Prints a list of items and their prices" do
    printed_menu = "Fish £2.00, Chips £3.50"
    expect(menu.print_dishes).to eq printed_menu
  end

  it "tells if a dish is on the menu" do
    expect(menu.has_dish?(:fish)).to be true
  end

  it "tells if a dish is not on the menu" do
    expect(menu.has_dish?(:beef)).to be false
  end

end
