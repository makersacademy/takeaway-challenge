require 'basket'
describe Basket do
  let(:dish_double) {double :a_dish, :name => "A Dish", :price => 10.00}
  it 'gets created with a single dish, dish quantity and dish-total price when passed a dish and its quantity' do
    dish_quantity = 2
    basket = Basket.new(dish_double, dish_quantity)
    expect(basket.items).to eq([{dish: dish_double, quantity: 2, dish_total_price: 20.00}])
  end
end
