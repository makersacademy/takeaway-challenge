require "pizza_place"

describe PizzaPlace do

  subject(:pizza) { PizzaPlace.new(menu: menu) }

  let(:menu) { double(:menu, prints: menu_print) }
  let(:menu_print) { "Margarita: £9" }

  it "shows the items and prices" do
    expect(pizza.print_menu).to eq(menu_print)
  end
  
end
