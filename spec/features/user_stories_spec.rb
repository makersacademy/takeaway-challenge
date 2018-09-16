require 'menu'
require 'order'

describe 'User Stories' do
  let(:menu)  { Menu.new }
  let(:order) { Order.new(sms) }
  let(:sms) { double :sms }
  let(:dish_1) { double :dish, :name => 'steamed pork dumpling', :price => 1.50 }
  let(:dish_2) { double :dish, :name => 'spare ribs', :price => 4.50 }
  let(:dish_3) { double :dish, :name => 'prawn crackers', :price => 1 }

  def one_hours_time
    now = Time.new
    "%02d" % (now.hour + 1) + ":" + "%02d" % now.min
  end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so I can see the dishes on the menu' do
    expect { menu.dishes }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so I can select dishes to order' do
    dish = menu.dishes.first
    quantity = 1
    expect { order.add_dish(dish, quantity) }.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so I can check the total price of my order' do
    order.add_dish(dish_1, 2)
    order.add_dish(dish_2, 1)
    order.add_dish(dish_3, 3)
    expect(order.total).to eq((dish_1.price * 2) + dish_2.price + (dish_3.price * 3))
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as:
  #   "Thank you! Your order was placed and will be delivered before 18:52"
  # after I have ordered
  it 'so I know the order was placed I want to receive an SMS confirmation' do
    order.add_dish(dish_1, 2)
    order.add_dish(dish_2, 1)
    order.add_dish(dish_3, 3)
    allow(sms).to receive(:send)
    expect(sms).to receive(:send).with(
      "Thank you! Your order was placed and will be delivered before #{one_hours_time}"
    )
    order.place_order
  end
end
