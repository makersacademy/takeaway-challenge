require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      burger: 8.99,
      steak: 14.99
    }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "will print a list of dishes with prices" do
    printed_menu = "Burger £8.99, Steak £14.99"
    expect(menu.display).to eq(printed_menu)
  end

  it "can tell if a dish is on the menu" do
    expect(menu.has_dish?(:burger)).to be(true)
  end

  it "can tell if a dish is not on the menu" do
    expect(menu.has_dish?(:lobster)).to be(false)
  end
end
