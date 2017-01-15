require 'take_away'

describe 'Feature tests for User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

it 'customer can see the list of dishes with prices' do
  take_away = TakeAway.new
  # expect to print a formatted menu in the command line
  expect { take_away.read_menu }.to output.to_stdout
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

it 'customer can place an order with selected number of items' do
  take_away = TakeAway.new
  take_away.read_menu
  order_hash = { 1 => 3, 6 => 2, 9 => 1}
  total = take_away.place_order(order_hash)
  expect(total).to eq(85)
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

it 'customer can see the order details with prices' do
  take_away = TakeAway.new
  take_away.read_menu
  order_hash = { 1 => 3, 6 => 2, 9 => 1}
  take_away.place_order(order_hash)
  take_away.order_details
  expect { take_away.order_details }.to output.to_stdout
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order for the total amount if $[x] was placed and will be delivered before 18:52" after I have ordered

it 'when order send customer recieves a text message with time and order total amount' do
  take_away = TakeAway.new
  order_hash = { 1 => 3, 6 => 2, 9 => 1}
  take_away.place_order(order_hash)
  message = "Thank you! Your order for the total amount if $85 was placed and will be delivered before 18:52"
  # expect { customer }.to receive_a(text_message) on his phone
end


end
