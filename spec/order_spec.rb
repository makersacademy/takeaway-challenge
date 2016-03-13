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
      order.place_order("Chicken", 2)
      expect(order.myorder).to eq({"Chicken" => 2})
    end

    it "customer can't add non menu items to order" do
      order = Order.new
      expect{order.place_order("Chicken Soup", 2)}.to raise_error("Sorry, that is not a dish on the menu")
    end
  end


  describe "#totalbill" do
    it "should be able to view total of myorder" do
      order = Order.new
      order.place_order("Chicken", 2)
      order.place_order("Lamb", 2)
      expect{order.confirm_order(10)}.to raise_error("Sorry that does not match the total")
    end

  end

end