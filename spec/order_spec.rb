require "order"

describe Order do
  describe "#new_item" do
    it "finds the ordered item(s) from the menu and saves it into complete_order" do
      order = Order.new
      order.new_item("Duck_Pancakes")
      expect(order.complete_order).to eq([{ Dish: "Duck_Pancakes", Price: "£12"}])
    end

  end

end
