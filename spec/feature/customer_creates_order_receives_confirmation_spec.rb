feature 'Customer creates order and receives confirmation text' do
  let(:restaurant) { Restaurant.new }
  let(:dish) { Dish.new("Chicken curry") }
  let(:order) { Order.new }
  before(:each) do
    restaurant.load_dishes(dish)
  end
  scenario 'Customer creates order' do
    order.add_dish(dish)
    expect(customer.add_order(order)).to eq order
  end
  xscenario 'customer receives confirmation text'
end
