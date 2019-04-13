require "menu"
describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    {
      Chicken_balls: 3.99,
      beef_in_blackbeans: 4.50
    }
  end

  it "has a list of dishes and prices" do
    expect(menu.dishes).to eq(dishes)
end

  it "prints a list of dishes with prices" do
    printed_menu = "Chicken_balls £3.99, Beef_in_blackbeans £4.50"
    expect(menu.print).to eq(printed_menu)
end

it "tells if a dish is on the menu" do
  expect(menu.has_dish?(:Chicken_balls)).to be (true)
end

  it "tells if a dish is not on the menu" do
    expect(menu.has_dish?(:fish)).to be (false)
  end

  it "calculates a price" do
    expect(menu.price(:Chicken_balls)).to eq(dishes[:Chicken_balls])
  end
end
