require 'order'

describe Order do

  describe "#viewmenu" do
    it "customer can view menu" do
      order = Order.new
      expect(order.show_menu).to eq ({ "Chicken" => 5, "Lamb" => 8, "Chips" => 2 })
    end
  end

  describe "#order" do
    it "customer can add item to order" do
      order = Order.new
      order.place_order("Chicken", 2, 10)
      expect(order.myorder).to eq({"Chicken" => 2})
    end

    it "customer can't add non menu items to order" do
      order = Order.new
      expect{order.place_order("Chicken Soup", 2, 6)}.to raise_error("Sorry, that is not a dish on the menu")
    end

    it "cannot order if total doesn't match" do
    order = Order.new
    order.place_order("Chicken", 2, 15).to raise_error("Recalculate your total")
  end
end
end