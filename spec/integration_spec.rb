require 'menu'
require 'order'

def menu
  menu = [
    { "Pizza" => 7 },
    { "Fish and Chips" => 9 },
    { "Pancakes with Bacon and Maple Syrup" => 6 },
    { "Vegetable Stir Fry with Gyoza" => 8 },
    { "Cheese and Pickle Sandwich" => 4 },
    { "Ramen" => 6 },
    { "Beef Pho" => 9 }
  ]
end

RSpec.describe 'integration' do
  it "returns the menu" do
    expect(menu).to eq ([
      { "Pizza" => 7 },
      { "Fish and Chips" => 9 },
      { "Pancakes with Bacon and Maple Syrup" => 6 },
      { "Vegetable Stir Fry with Gyoza" => 8 },
      { "Cheese and Pickle Sandwich" => 4 },
      { "Ramen" => 6 },
      { "Beef Pho" => 9 }
    ])
  end

  it "initially has empty order" do
    order = Order.new
    expect(order.order_complete).to eq ([])
  end

  it "can have an item added to it" do
    order = Order.new
    item = menu[0]
    order.add(item)
    expect(order.order_complete).to eq ([{ "Pizza" => 7 }])
  end

  it "can have more than one item added to it" do
    order = Order.new
    item1 = menu[0]
    item2 = menu[1]
    order.add(item1)
    order.add(item2)
    expect(order.order_complete).to eq ([{ "Pizza" => 7 }, { "Fish and Chips" => 9 }])
  end

  it "can return the total of an ordered item" do
    order = Order.new
    item = menu[0]
    order.add(item)
    expect(order.order_total).to eq "Your order was received and its total is 7!"
  end

  it "can return the total when more than one item added" do
    order = Order.new
    item1 = menu[0]
    item2 = menu[1]
    order.add(item1)
    order.add(item2)
    expect(order.order_total).to eq "Your order was received and its total is 16!"
  end
end
