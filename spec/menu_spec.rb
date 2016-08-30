require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      pork: 6.99,
      beef: 9.50
    }
  end

  it "has a list of dishes with prices" do
    expect(menu.dishes).to eq(dishes)
  end

  it "prints a list of dishes with prices" do
    printed_menu = "Pork 6.99, Beef 9.50"
    expect(menu.print).to eq(printed_menu)
  end

  it "tells if a dish is on the menu" do
    expect(menu.has_dish?(:pork)).to be true
  end

  it "tells if a dish is not on the menu" do
    expect(menu.has_dish?(:chicken)).to be false
  end

  it "calculates a price" do
    expect(menu.price(:pork)).to eq(dishes[:pork])
  end
end
