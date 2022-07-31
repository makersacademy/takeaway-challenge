require "order"

describe Order do
  let(:chips) {double("dish double", :name => "chips", :price => 2.50)}
  let(:mcdonalds) {double("menu double", :dishes => [chips],)}
  let(:menu_class) {double("menu class double", :new => mcdonalds)}
  let(:dish_class) {double("dish class double", :new => chips)}
  let(:confirmation) {double("confirmation double", :send_confirmation => "CONFIRMATION SENT!")}
  let(:confirmation_class) {double("confirmation class double", :new => confirmation)}
  let(:order) {Order.new(menu_class, dish_class, confirmation_class)}
  describe ".initialize" do
    it "should create a new Order instance with a selected items array" do
      expect(order.selected_items).to eq([])
    end
  end
  describe ".display_menu" do
    it "should display a list of menu items and prices" do
      expect{order.display_menu}.to output("1. chips £2.5\n").to_stdout
    end
  end
  describe ".add_order_item" do
    it "should add a selected dish to selected items array" do
      expected_result = [chips]
      order.add_order_item(1)
      expect(order.selected_items).to eq(expected_result)
    end
    it "should add a selected dish with quantity to selected items array" do
      expected_result = [chips, chips, chips]
      order.add_order_item(1, 3)
      expect(order.selected_items).to eq(expected_result)
    end
    it "should raise error if trying to order off menu with a number" do
      expect{order.add_order_item(5, 2)}.to raise_error("This is not a menu item! Please pick something from our menu!")
    end
    it "should raise error if trying to order off menu with a non integer" do
      expect{order.add_order_item("fish", 2)}.to raise_error("This is not a menu item! Please pick something from our menu!")
    end
  end
  describe ".check_total" do
    it "should return total of order" do
      order.add_order_item(1)
      order.add_order_item(1)
      expect(order.check_total).to eq(5)
    end
    it "should raise an error if nothing has been ordered" do
      expect{order.check_total}.to raise_error("You haven't ordered anything yet!")
    end
  end
  describe ".submit_order" do
    it "should return total price" do
      order.add_order_item(1, 3)
      expect(order.submit_order).to eq("CONFIRMATION SENT!")
    end
  end
end
