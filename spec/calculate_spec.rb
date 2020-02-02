require "calculator.rb"

describe Calculator do
  describe " #checkout" do
    it "should respond to two arguments" do
      expect(Calculator).to respond_to(:current_basket).with(2).argument
    end

    it "should return a hash with the item_name, quantity and subtotal" do
      order = {"Pilau rice": 1}
      dishes = {"Pilau rice": 3.00}
      expect(Calculator.current_basket(order, dishes)).to eq ({item_name: "Pilau rice", quantity: 1, subtotal: 3.0})
    end
  end
end