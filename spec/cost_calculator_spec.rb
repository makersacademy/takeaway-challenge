require "cost_calculator"

RSpec.describe "CostCalculator" do

  before(:each) do
    @calc = CostCalculator.new
  end

  describe "#initialize" do
    it "intiates the variable total_price with a value of zero" do
      expect(@calc.total_price).to eq(0)
    end
  end

  describe "#price_for_dish" do
    it "gets the price for an ordered dish from the menu" do
      @menu = double("menu", menu_contents: {"Fish" => 2})
      @order = double("order", current_order: {"dish" => "Fish", "quantity" => 3})
      expect(@calc.price_for_dish(@order.current_order, @menu.menu_contents)).to eq(2)
    end
  end

  describe "#quantity_of_dish" do
    it "returns the quantity of a given dish from an order" do
      @order = double("order", current_order: {"dish" => "Fish", "quantity" => 3})
      expect(@calc.quantity_of_dish(@order.current_order)).to eq(3)
    end
  end

  describe "#price_for_quantity" do
    it "returns the price of a dish multiplied by it's quantity" do
      allow(@calc).to receive(:price_for_dish) {2}
      allow(@calc).to receive(:quantity_of_dish) {3}
      expect(@calc.price_for_quantity("order_hash", "menu")).to eq(6)
    end
  end

  describe "#calculate" do
    it "adds the total of each type of item ordered to the total price" do
      order = [{"dish" => "Fish", "quantity" => 3}, {"dish" => "Chips", "quantity" => 1}]
      menu = double("menu", menu_contents: {"Fish" => 3, "Chips" => 2})
      @calc.calculate(order, menu.menu_contents)
      expect(@calc.total_price).to eq(11)
    end
  end

end
