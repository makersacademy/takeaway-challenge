require "calculator.rb"

describe Calculator do
  
  describe " #checkout" do
    it "should respond to two arguments" do
      expect(Calculator).to respond_to(:current_basket).with(2).argument
    end

    it "should return a hash with the item_name, quantity and subtotal" do
      order = {"Pilau rice": 1}
      dishes = {"Pilau rice": 3.00}
      expect(Calculator.current_basket(order, dishes)).to eq ([{item_name: "Pilau rice", quantity: 1, subtotal: 3.0}])
    end

    it "should return a hash with the item_name, quantity and subtotal for MULTIPLE items" do
      order = {"Pilau rice": 1, "Tikka Masala": 3}
      dishes = {"Pilau rice": 3.00, "Tikka Masala": 5.00}
      expect(Calculator.current_basket(order, dishes)).to eq ([{item_name: "Pilau rice", quantity: 1, subtotal: 3.0}, {item_name: "Tikka Masala", quantity: 3, subtotal: 15.0}])
    end
  end

  describe " #total" do
  
  before(:example) do
    order = {"Pilau rice": 1, "Tikka Masala": 3}
    dishes = {"Pilau rice": 3.00, "Tikka Masala": 5.00}
    Calculator.current_basket(order, dishes)
  end

    it "should return sum based on current_basket output" do
      expect(Calculator.total).to eq(18)
    end

  end
end

# [{item_name: "Pilau rice", quantity: 1, subtotal: 1.50}, {item_name: "Poppadom", quantity: 4, subtotal: 2.00}]