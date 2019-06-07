require "cost_calculator"

RSpec.describe "Cost_calculator" do

  before(:each) do
    @order = double("order", quantity: 2, dish: "Fish")
  end

  describe "price_quantity" do
    xit 'multiplies the prices from the menu with the quantity of the dish on the order' do
      calc = Cost_calculator.new
      expect(calc.price_quantity(@order)).to eq(6)
    end
  end

end
