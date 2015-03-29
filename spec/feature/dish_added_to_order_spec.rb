require 'capybara/rspec'
feature 'Restaurant dish can be added to order and total shown' do
  let(:restaurant) { Restaurant.new }
  let(:dish) { Dish.new("chicken curry", 3.50) }
  before(:each) do
    restaurant.add_dish(dish)
  end
  scenario '#add_dish to ::order' do
    restaurant.list_dishes
    expect(order.add_dish(dish)).to eq dish
  end
end
