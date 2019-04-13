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
end
