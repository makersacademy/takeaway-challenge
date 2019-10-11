require "menu"

describe Menu do
  subject(:menu) { described_class.new(foods) }

  let(:foods) { {fries: 2, drink: 1} }

  it "list of dishes with prices" do
    expect(menu.foods).to eq(foods)
  end

  it "prints a list of dishes with prices" do
    p_menu = "fries £2.00, drink £1.00"
    expect(menu.print_menu).to eq(p_menu)
  end

  it "tells if a dish is on the menu" do
    expect(menu.has_food?(:fries)).to be true
  end

  it "tells if a dish is not on the menu" do
    expect(menu.has_food?(:beef)).to be false
  end

  it "calculates a price" do
    expect(menu.price(:fries)).to eq(foods[:fries])
  end
end
