require "menu"

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do 
    { margarita: 5.00, sandwich: 2.99 }
  end

  it "has a list of dishes and their prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints the dishes and their prices" do
    printed_menu = "Margarita £5.00, Sandwich £2.99"
    expect(menu.show).to eq(printed_menu)
  end

  it "tell us that a dish is on the menu" do
    expect(menu.has_dish?(:margarita)).to be true
  end

  it "tell us that a dish is not on the menu" do
    expect(menu.has_dish?(:cheese)).to be false
  end
end
