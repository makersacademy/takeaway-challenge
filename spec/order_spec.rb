require 'order'

describe Order do
  subject(:order) { described_class.new }

  it "returns menu when order.menu called" do
    expect(order.show_menu).to eq({"Vindaloo" => 6, "Chips" => 3})
  end

  it "allows the user to select from meals and add to basket" do
    expect(order.basket_add("Vindaloo", 2)).to eq(["2 portion(s) of Vindaloo"])
  end

  it "allows the user to select from the available meals and get the price" do
    expect(order.add("Vindaloo", 2)).to eq("Your total cost is £12")
  end

  it "lets the user to compare their total with the prices" do
    order.add("Vindaloo", 2)
    expect(order.verify_price("Vindaloo", 2)).to eq("Your total is £12 - Vindaloo (£6) x2 = £12")
  end
end
