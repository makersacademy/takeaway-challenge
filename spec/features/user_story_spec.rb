require 'order.rb'

describe 'User Stories' do
  subject(:order) { Order.new }
  subject(:confirmation) { Confirmation.new}
  let(:item_1) { double :item1}
  let(:item_2) { double :item2}
  let(:item_3) { double :item3}
  let(:total_cost) { double :total_cost }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'allows the customer to view the menu' do
    takeaway_restaurant = Restaurant.new
    expect(takeaway_restaurant.menu_items).to include({ chicken_curry: 9.50 })
    expect(takeaway_restaurant.menu_items).to include({ pork_belly: 7.99 })
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'allows customer to place order with suspected total and returns the actual total' do
    takeaway_restaurant = Restaurant.new
    menu = takeaway_restaurant.menu_items
    order = takeaway_restaurant.create_order 
    order.add_item(:chicken_curry, 5)
    expect(order.submit(47.5)).to eq(menu[:chicken_curry] * 5)
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'raises an error if the suspected total of my order is wrong' do
    takeaway_restaurant = Restaurant.new
    order = takeaway_restaurant.create_order
    order.add_item(:chicken_curry, 5)
    order.add_item(:pork_belly, 3)
    expect { order.submit(10) }.to raise_error "The suspected total is wrong"
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
# Hints on functionality to implement:

before do 
  stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/ACdffb9edd5111340d41549cb5fdf96bc0/Messages.json").
           with(
             body: {"Body"=>"Your order total is confirmed, total cost is 47.5 and will be delivered by 11am", "From"=>"+441133205765", "To"=>"+447412525804"},
             headers: {
            'Accept'=>'application/json',
            'Accept-Charset'=>'utf-8',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Authorization'=>'Basic QUNkZmZiOWVkZDUxMTEzNDBkNDE1NDljYjVmZGY5NmJjMDpmZDE1ZWU5OWNkMTRhNmQ2YTg5NmY2M2I0NDFmZjdjMQ==',
            'Content-Type'=>'application/x-www-form-urlencoded',
            'User-Agent'=>'twilio-ruby/5.10.2 (ruby/x86_64-darwin17 2.5.0-p0)'
             }).
           to_return(status: 200, body: "", headers: {})
end

  it 'when the total is correct it sends a text when the order is placed' do
    takeaway_restaurant = Restaurant.new
    order = takeaway_restaurant.create_order
    order.add_item(:chicken_curry, 5)
    order.submit(47.5)
  end


end

# Ensure you have a list of dishes with prices
# Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
# The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
# Use the twilio-ruby gem to access the API
# Use the Gemfile to manage your gems
# Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
# However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
# Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.