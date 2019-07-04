require './lib/restaurant.rb'
require './lib/takeaway-app.rb'


describe "Takeaway_application features" do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "shows a list of meals with their prices" do
    restaurant = Restaurant.new
    food_app = TakeawayApp.new
    allow(restaurant).to receive(:menu)
  end
end