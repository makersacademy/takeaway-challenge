require 'menu.rb'
require 'order.rb'


describe 'User Stories' do
  subject(:menu) { Menu.new }
  subject(:order) { Order.new }
  let(:item_1) { double :item1}
  let(:item_2) { double :item2}
  let(:item_3) { double :item3}

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'allows the customer to view the menu' do
    expect { menu }.not_to raise_error
  end

  it 'allows the customer to see a list of dishes with prices' do
    expect(menu.view_menu).to include "1. Chicken Curry, £9.99"
    expect(menu.view_menu).to include "5. Pork Belly, £7.99"
    expect(menu.view_menu).to include "7. Mushroom Soup, £1.99"
  end 

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'can create an order' do
    expect { Order.new }.not_to raise_error
  end

  it 'can add items to the order' do
    order.add_item(item_1, 4)
    expect(order.current_items[0]).to eq([item_1, 4])
  end

  it 'can store more than 1 item in its current items' do
    order.add_item(item_1, 6)
    order.add_item(item_2, 5)
    order.add_item(item_3, 3)
    expect(order.current_items.length).to eq 3
  end

  it 'can submit the current order to the restaurant' do
    order.add_item(item_1, 6)
    order.add_item(item_2, 5)
    order.add_item(item_3, 3)
    restaurant = Restaurant.new
    restaurant.submit(order.current_items)
    expect(restaurant.received_orders).to eq order.current_items
  end

end


# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order



# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
# Hints on functionality to implement:

# Ensure you have a list of dishes with prices
# Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
# The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
# Use the twilio-ruby gem to access the API
# Use the Gemfile to manage your gems
# Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
# However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
# Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.