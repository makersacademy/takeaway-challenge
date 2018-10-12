require "order"

describe Order do
  subject(:order) { described_class.new }

  it "displays the list of items and prices" do
    expect(order).to respond_to(:view)
  end

  it "returns items and prices" do
    expect{ order.view }.to output("Burger, 3\nHotdog, 2\n").to_stdout
  end
end
