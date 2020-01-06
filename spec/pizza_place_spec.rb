require "pizza_place"

describe PizzaPlace do

  subject(:pizza) { PizzaPlace.new(menu: menu, order: order, text: text) }

  let(:menu_print) { "Margarita: £9" }
  let(:text) { double(:text, deliver: nil) }
  let(:order) { double(:order, total: 30) }
  let(:menu) { double(:menu, prints: menu_print) }
  let(:items) { { Margerita: 1, Pepperoni: 2, Vegetable: 3 } }

  before do
    allow(order).to receive(:add)
  end

  it "shows the items and prices" do
    expect(pizza.print_menu).to eq(menu_print)
  end

  it "can order number of avaliable dishes" do
    expect(order).to receive(:add).exactly(3).times
    pizza.place_order(items)
  end

  it "calculates the order total" do
    total = pizza.place_order(items)
    expect(total).to eq(30)
  end

  it "sends a text when the order has been placed" do
    expect(text).to receive(:deliver)
    pizza.place_order(items)
  end
  
end
