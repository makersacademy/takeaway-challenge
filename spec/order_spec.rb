require './lib/order.rb'

describe Order do
  it 'initializes a menu of dishes and their prices' do
    order = Order.new
    expect(order.menu).to eq([
      {dish: "Jasmine Rice", price: 2.50},
      {dish: "Coconut Rice", price: 3.50},
      {dish: "Egg Noodles", price: 4.75},
      {dish: "Egg Fried Rice", price: 3.50},
      {dish: "Chicken Red Thai Curry", price: 4.75},
      {dish: "Pork Green Thai Curry", price: 5.75},
      {dish: "Stir-fry Duck with Ginger", price: 5.75},
      {dish: "Stir-fry Beef with Mushroom", price: 5.75},
      {dish: "Stir-fry Squid with Veg", price: 5.75},
      {dish: "Mixed Seafood", price: 4.75},
      {dish: "Spring Rolls (6)", price: 3.50}
      ])
  end

  context '#view' do
    it 'display the full menu to the customer' do
      order = Order.new
      expect(order.view_menu).to eq(order.menu)
    end
  end
end
