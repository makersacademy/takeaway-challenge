require 'capybara/rspec'
require 'dish'
feature 'Restaurant dish can be added to order and total shown' do
  let(:restaurant) { Restaurant.new }
  let(:dish) { Dish.new("Chicken curry") }
  before(:each) do
    restaurant.load_dishes(dish)
  end
  scenario '#add_dish to ::order' do
    restaurant.list_dishes
    expect(order.add_dish(dish)).to eq dish
  end
end
