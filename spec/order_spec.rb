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

  describe "print_order" do
    let(:mock_printer) {double :mock_printer => :print_bill }
    it "sends an order and bill to the printer"do
      order = Order.new(mock_printer)
      expect(order.print_order).to eq(order.print_class.print_bill(order.complete_order, order.total))
    end


  end

  end

end
