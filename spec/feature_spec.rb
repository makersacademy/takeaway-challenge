require 'menu'
require 'order'

describe 'Feature' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so I decide to order, I want to see the menu' do
    menu = Menu.new
    expect(menu.show).to include('chips' => 1, 'oreo' => 3, 'cake' => 2)
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so I can order a meal, I want to selects dishes' do
    order = Order.new('chips')
    order.add('cake', 3)
  end
  it 'so I can order a meal, I want to ensure dishes are available' do
    expect{Order.new('matress')}.to raise_error 'unknown item inputted, please enter an item on the menu'
  end
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so I can check my order, I want to compare the total price is the sum of my items' do
    menu = Menu.new
    menu.show
    order = Order.new('cake', 1)
    order.add('oreo', 2)
    order.place
    order.add('oreo', 3)
    order.deduct('oreo',1)
  end
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed
  # and will be delivered before 18:52" after I have ordered
  it "so I know the delivery time, I would like to recieve a text" do
    #text to be recieved
  end

end
