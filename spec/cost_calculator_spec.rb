require "cost_calculator"

RSpec.describe "Cost_calculator" do

  describe "price_quantity" do

    it 'multiplies the prices from the menu with the quantity of the dish on the order' do
      @order = double("order", current_order:[{"dish" => "Fish", "quantity" => 3},{ "dish" => "Chips", "quantity" => 1}])
      @menu = double("menu", menu_contents: {"Fish" => 3, "Chips" => 2} )
      calculator = Cost_calculator.new
      calculator.price_quantity(@order.current_order, @menu.menu_contents)
      expect(calculator.total_price).to eq(11)
    end

  end

end
