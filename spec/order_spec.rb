require 'order'

describe Order do
  subject(:order) { described_class.new }

  it "returns menu when order.menu called" do
    expect(order.show_menu).to eq({"Vindaloo" => 6, "Chips" => 3})
  end

  it "allows the user to select from meals and add to basket" do
    expect(order.basket_add("Vindaloo", 2)).to eq("2 x Vindaloo and 0 x Chips so far")
  end

  it "allows the user to select from the available meals and get the price" do
    expect(order.add("Vindaloo", 2)).to eq("Your total cost is £12")
  end

  it "lets the user to compare their total with the prices" do
    order.add("Vindaloo", 2)
    order.add("Chips", 1)
    order.add("Vindaloo", 1)
    expect(order.verify_price).to eq("Your total is £21 - 3 lots of Vindaloo at £18, and 1 lots of Chips at £3")
  end
end
