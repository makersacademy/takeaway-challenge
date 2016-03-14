require 'order'
require 'menu'
describe Order do
subject(:order) { described_class.new }

  describe "#order" do
    it "customer can add item to order" do
      order.place_order("Chicken", 2)
      expect(order.myorder).to eq({"Chicken" => 2})
    end

    it "customer can't add non menu items to order" do
      expect{order.place_order("Chicken Soup", 2)}.to raise_error("Sorry, that is not a dish on the menu")
    end
  end

  describe "#confirm_order" do
    it "raise error if order total doesn't match inputted total " do
      order.place_order("Chicken", 2)
      order.place_order("Lamb", 2)
      expect{order.confirm_total(10)}.to raise_error("Sorry that does not match the total")
    end

  end

end