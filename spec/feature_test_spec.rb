require 'customer'

describe 'Feature tests for User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

it 'customer can see the list of dishes with prices' do
  customer = Customer.new
  # expect to print a formatted menu in the command line
  expect { customer.see_menu }.to output.to_stdout
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

it 'customer can place an order with selected number of items' do
  customer = Customer.new
  customer.see_menu
  order_hash = { 1 => 3, 6 => 2, 9 => 1}
  total = customer.place_order(order_hash)
  expect(total).to eq(85)
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

it 'customer can see the order details with prices' do
  customer = Customer.new
  customer.see_menu
  order_hash = { 1 => 3, 6 => 2, 9 => 1}
  customer.place_order(order_hash)
  customer.see_order
  expect { customer.see_order }.to output.to_stdout
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
