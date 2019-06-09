require 'pierogi'
require 'order'

RSpec.describe 'Pierogi Bar' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'displays menu with prices' do
    pierogi = Pierogi.new
    expect(pierogi.show_food).to eq("small pierogi for 1\nlarge pierogi for 3\nsupersize pierogi for 4\nmeat pierogi for 4\nchocolate pierogi for 2\nhoney pierogi for 2")
  end

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
    expect(order.show_basket).to eq("small pierogi - 1, large pierogi - 3, honey pierogi - 2")
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given 
# matches the sum of the various dishes in my order

  it 'shows order total' do
    pierogi = Pierogi.new
    order = Order.new
    pierogi.accept_order(order)
    choice1 = "large pierogi"
    choice2 = "supersize pierogi"
    order.add_to_order(choice1)
    order.add_to_order(choice2)
    expect(order.total).to eq 7
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was 
# placed and will be delivered before 18:52" after I have ordered

end
