require 'basket_item'
describe BasketItem do
  let(:dish_double) {double :a_dish, :name => "A Dish", :price => 10.00}
  it 'gets created with the input dish and its quantity' do
    dish_quantity = 2
    basket_item = BasketItem.new(dish_double, dish_quantity)
    expect(basket_item.dish).to equal dish_double
    expect(basket_item.quantity).to equal dish_quantity
    expect(basket_item.dish_total_price).to equal (dish_double.price * dish_quantity)
  #([{dish: dish_double, quantity: 2, dish_total_price: 20.00}])
  end
end
