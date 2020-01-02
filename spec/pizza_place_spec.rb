require "pizza_place"

describe PizzaPlace do

  subject(:pizza) { PizzaPlace.new(menu: menu, order: order) }

  let(:menu) { double(:menu, prints: menu_print) }
  let(:menu_print) { "Margarita: £9" }
  let(:order) { double(:order) }

  let(:items) { { Margerita: 1, Pepperoni: 2, Vegetable: 3 } }

  it "shows the items and prices" do
    expect(pizza.print_menu).to eq(menu_print)
  end

  it "can order number of avaliable dishes" do
    expect(order).to receive(:add).exactly(3).times
    pizza.place_order(items)
  end
  
end
