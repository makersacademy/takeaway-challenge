require './lib/restaurant.rb'
require './lib/takeaway-app.rb'

describe "Takeaway_application features" do

  let(:restaurant) { Restaurant.new }
  let(:food_app) { TakeawayApp.new(restaurant) }

  scenario "a customer wants to see some food" do
    food_app = TakeawayApp.new(restaurant)
    expect(food_app.restaurant_menu).to eq(restaurant.menu)
  end

  scenario "a customer wants to order some food" do
    selection, qty, total = 'Margarita', 1, 10
    food_app.menu(selection, qty, total)
    selection, qty, total = 'Pepperoni', 2, 24
    food_app.menu(selection, qty, total)
    selection, qty, total = 'Vegetarian', 3, 33
    food_app.menu(selection, qty, total)
    expect(food_app.menu_selection).to eq [['Margarita', 1, 10], ['Pepperoni', 2, 24], ['Vegetarian', 3, 33]]
  end

  

end
