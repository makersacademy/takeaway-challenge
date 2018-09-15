require "order"

describe Order do
  describe "#new_item" do
    it "finds the ordered item from the menu and saves it into complete_order" do
      order = Order.new
      order.new_item("Duck_Pancakes", 1)
      expect(order.complete_order).to eq([{ Dish: "Duck_Pancakes", Price: "12"}])
    end

    it "can add more than multiple quantites of an item to an order" do
      order = Order.new
      order.new_item("Duck_Pancakes", 2)
      expect(order.complete_order).to eq([{ Dish: "Duck_Pancakes", Price: "12"}, { Dish: "Duck_Pancakes", Price: "12"}])
    end
end

  describe "#total" do
    let(:food_options) { double :food_options }
    let(:mock_calculator) { double :mock_calculator, :calculate_total => "something" }

    it "uses the calculator to get a total" do
      order = Order.new(food_options, mock_calculator)
      expect(order.total).to eq(order.calculator.calculate_total(order.complete_order)) #poss order.mock)calcuator
    end

  end

end
