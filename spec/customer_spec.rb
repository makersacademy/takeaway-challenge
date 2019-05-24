require './lib/customer.rb'

describe Customer do
  let(:customer) { Customer.new(order_double_class) }
  let(:order_double_class) { double(:order_double_class, :new => order) }
  let(:order) { double(:order, :view_menu => menu) }
  let(:menu) {[
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
    ]}

  context '#view_menu' do
    it 'display\'s a list of dishes and their prices' do
      expect(customer.view_menu).to eq(menu)
    end
  end

  context '#add' do
    it 'adds a dish to their order' do
      expect(order).to receive(:add)
      customer.add_to_order("Jasmine Rice", 1)
    end
  end
end
