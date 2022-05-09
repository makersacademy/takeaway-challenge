require "order"

describe Order do
  describe "#order" do
    it "allows user to select number of dishes" do
      order = Order.new
      order.choose("lasagna")
      order.choose("gnocchi")
      expect(order.choices).to eq [["lasagna", 10], ["gnocchi", 7]]
    end

    it "allows user to verify sum of dishes" do
      order = Order.new
      order.choose("lasagna")
      order.choose("gnocchi")
      expect(order.verify).to eq "Your current total is 17."
    end
  end

  it "returns thank you for ordering text" do
    order = Order.new
    order.choose("Lasagna")
    expect(order.submit).to eq "Thanks for ordering! Your order is on its way!"
  end
end
