require 'dish'
require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

describe '#feature tests'do
  
  it 'returns a list of dishes with prices' do
    menu = Menu.new
    menu.add('pizza',9.99)
    menu.add('fish & chips', 12.00)
    menu.add('curry', 12.99)
    menu.add('sushi', 16.00)
    expect(menu.print).to eq("pizza 9.99\nfish & chips 12.0\ncurry 12.99\nsushi 16.0")
  end
  
  it 'allows a customer to select dishes and their quantity' do
    menu = Menu.new
    menu.add('pizza',9.99)
    menu.add('fish & chips', 12.00)
    order = Order.new(menu)
    order.add('pizza', 1)
    order.add('fish & chips',3) 
  end
  
  it 'returns the price of the total order so a customer can check it ' do
    menu = Menu.new
    menu.add('pizza',9.99)
    menu.add('fish & chips', 12.00)
    menu.add('sushi', 16.00)
    order = Order.new(menu)
    order.add('pizza', 1)
    order.add('fish & chips',3)
    order.add('sushi',2)
    expect(order.total_price).to eq(77.99)
  end

  it 'sends a text message once customer confirms order amount' do
    restaurant_double = double(:restaurant, confirm_order: 'Thank you! Your order was placed')
    menu = Menu.new
    menu.add('pizza',9.99)
    menu.add('fish & chips', 12.00)
    menu.add('sushi', 16.00)
    order = Order.new(menu)
    order.add('pizza', 1)
    order.add('fish & chips',3)
    order.add('sushi',2)
    expect(order.place_order(77.99, restaurant_double)).to eq('Thank you! Your order was placed')
  end
end