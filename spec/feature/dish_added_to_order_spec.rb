require 'capybara/rspec'
require 'restaurant'
feature 'User can view dishes & place an order' do
  let(:restaurant) { Restaurant.new }
  before(:each) do
    restaurant.load_dishes("./lib/dishes.txt")
  end
  scenario 'view dishes' do
    expect(restaurant.dishes).to include(
      "Chicken curry" => 3.5, "Lamb curry" => 4.0)
  end
  scenario 'user places an order' do
    order = Order.new(restaurant)
    dishes = {  "Chicken curry" => "3.5", "Lamb curry" => "4.0" }
    order.place_order(dishes)
  end
end
