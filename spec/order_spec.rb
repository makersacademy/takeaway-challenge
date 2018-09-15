require "order"

describe Order do
  describe "#new_item" do
    it "finds the ordered item from the menu and saves it into complete_order" do
      order = Order.new
      order.new_item("Duck_Pancakes", 1)
      expect(order.complete_order).to eq([{ Dish: "Duck_Pancakes", Price: "£12"}])
    end

    it "can add more than multiple quantites of an item to an order" do
      order = Order.new
      order.new_item("Duck_Pancakes", 2)
      expect(order.complete_order). to eq([{ Dish: "Duck_Pancakes", Price: "£12"}, { Dish: "Duck_Pancakes", Price: "£12"}])
    end

  end

end
