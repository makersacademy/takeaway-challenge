require "menu"

describe Menu do

  let(:menu) { described_class.new(dishes_list) }

  let(:dishes_list)do
    {
      fish: 5.00,
      chicken: 7.00
    }
  end

  it "has a list(hash) of dishes and prices" do
    expect(menu.dishes).to eq(dishes_list)
  end

  it "prints a menu" do
    printed_menu = "Fish : $5.0, Chicken : $7.0"
    expect(menu.print_m).to eq(printed_menu)
  end

  it "checks if dish is on the menu"do
    expect(menu.dish_exists?(:chicken)).to be true
  end

  it "checks if dish is not on the menu"do
    expect(menu.dish_exists?(:lamb)).to be false
  end

  it "calculates the price of total orders" do
    expect(menu.price(:chicken)).to eq(dishes_list[:chicken])
  end

end
