require './lib/order.rb'

describe Order do
  let(:order) { Order.new }
  let(:dish_double_class) { double(:dish_double_class, :new => dish) }
  let(:dish) { double(:dish) }

  it 'initializes a menu of dishes and their prices' do
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

  context '#view_menu' do
    it 'display the full menu to the customer' do
      expect(order.view_menu).to eq(order.menu)
    end
  end

  context '#add' do
    it 'tells dish to add the dish to basket in order' do
      expect(dish).to receive(:add)
      order.add("Jasmine Rice", 1, dish_double_class)
    end
  end
end
