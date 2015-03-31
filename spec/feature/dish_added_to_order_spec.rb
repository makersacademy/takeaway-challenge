require 'capybara/rspec'
require 'restaurant'
feature 'User can view dishes' do
  scenario 'view dishes' do
    restaurant = Restaurant.new
    restaurant.load_dishes("./lib/dishes.txt")
    expect(restaurant.dishes).to include(
      "Chicken curry" => 3.5, "Lamb curry" => 4.0)
  end
end
