require "menu"

describe Menu do

  let(:menu) {described_class.new(items)}
  let(:items) do {

    burger: 1.99,
    chicken: 1.00,
  }
  end

  it "has a list of items and their prices" do
    expect(menu.items).to eq(items)
  end

  it "prints a menu with items and prices" do
    printed_menu = "Burger £1.99, Chicken £1.00"
    expect(menu.show).to eq(printed_menu)
  end

  it "confirms whether an item is on the menu" do
    expect(menu.has_item?(:chicken)).to be true
  end

  it "confirms if an item is not on the menu" do
    expect(menu.has_item?(:fish)).to be false
  end

  it "knows the price of items" do
    expect(menu.price(:burger)). to eq(items[:burger])
  end

end
