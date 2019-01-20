RSpec.describe "Features and user stories:" do



# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

it 'so that a customer can order, display a menu for their options' do
  restaurant = Restaurant.new
  menu = Menu.new
  expect { restaurant.display_menu }.not_to raise_error
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

it 'so that customer can order, they can select a number of the dishes they want' do
  restaurant = Restaurant.new
  restaurant.order("rat soup")
  restaurant.order("bread", 2)
  expect {restaurant.current_order}.not_to raise_error
  p restaurant.current_order
end
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
