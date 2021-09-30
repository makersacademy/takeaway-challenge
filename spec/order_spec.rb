require "order"

describe Order do
  let(:mcdonalds) {double("menu double", :dishes => [["chips", 2.50]])}
  let(:order) {Order.new(mcdonalds)}
  describe ".initialize" do
    it "should create a new Order instance with a selected items array" do
      order = Order.new
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
      expected_result = [["chips", 2.50]]
      order.add_order_item(1)
      expect(order.selected_items).to eq(expected_result)
    end
  end
  describe ".check_total" do
    it "should return total of order" do
      order.add_order_item(1)
      order.add_order_item(1)
      expect(order.check_total).to eq(5)
    end
  end
end
