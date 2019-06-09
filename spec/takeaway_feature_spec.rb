require 'pierogi'
require 'order'

RSpec.describe 'Pierogi Bar' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
it 'displays menu with prices' do
  pierogi = Pierogi.new
  pierogi.add_menu("pierogi", 3)
  expect(pierogi.show_food).to eq({"pierogi" => 3})
end

pending 'can be added multiple items to days menu'

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several 
# available dishes
it 'creates new order that can be added multiple items' do
  order = Order.new
  starter = "small pierogi"
  main = "large pierogi"
  dessert = "honey pierogi"
  order.add_to_order(starter)
  order.add_to_order(main)
  order.add_to_order(dessert)
  expect(order.show_basket).to eq "small pierogi, large pierogi, honey pierogi"
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given 
# matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was 
# placed and will be delivered before 18:52" after I have ordered

end