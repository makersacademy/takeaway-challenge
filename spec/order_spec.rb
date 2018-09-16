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
  describe "#print_order" do
    let(:mock_printer) {double :mock_printer => :print_bill }
    it "sends an order and bill to the printer"do
      order = Order.new(mock_printer)
      expect(order.print_order).to eq(order.print_class.print_bill(order.complete_order, order.total))
    end
  end


   describe "#confirm_order" do
   context "total is incorrect" do
     it "checks the total with customer and raises error if incorrect" do
      order = Order.new
      allow(order).to receive(:total) {5}
      expect {order.place_order(6)}.to raise_error("I'm sorry that total is wrong, enter your total again or place a new order")
     end
    end

    context "total is correct" do
      let(:food_options) { double :food_options }
      let(:text_class) { double :text_class, :confirmation => 0 }
      let(:mock_printer) {double :mock_printer => :print_bill }
      let(:mock_calculator) { double :mock_calculator, :calculate_total => "something" }

      it "sends a text if the total is correct" do
        order = Order.new(food_options, mock_calculator, mock_printer, text_class)
        allow(order).to receive(:total) {5}
        expect(order.place_order(5)).to eq(order.text_class.confirmation)
      end

      end

  end


end
