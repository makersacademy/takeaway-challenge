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
require 'dish'
require 'menu'
require 'order'

describe 'user stories' do

  it 'so that orders can be placed display a list of dishes' do
    dish1 = Dish.new("Chicken", 2.99)
    dish2 = Dish.new("Beef", 3.50)
    list = [dish1, dish2]
    menu = Menu.new(list)
    expect(menu.list).to eql("Chicken, Beef")
  end

  it 'so that a meal can be planned orders can contain some number of several dishes' do
    dish1 = Dish.new("Chicken", 2.99)
    dish2 = Dish.new("Beef", 3.50)
    order = Order.new
    expect { order.add_dishes(dish1, 3) }.to change{ order.dishes }
    expect { order.add_dishes(dish2, 1) }.to change{ order.dishes }
  end

end
