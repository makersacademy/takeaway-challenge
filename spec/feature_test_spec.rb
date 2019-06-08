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
  pizza = Dish.new('pizza',9.99)
  fish_chips = Dish.new('fish & chips', 12.00)
  curry = Dish.new('curry', 12.99)
  sushi = Dish.new('sushi', 16.00)
  menu.add(pizza)
  menu.add(fish_chips)
  menu.add(curry)
  menu.add(sushi)
  expect(menu.print).to eq("pizza 9.99\nfish & chips 12.0\ncurry 12.99\nsushi 16.0")
end

xit 'allows a customer to select dishes and their quantity' do
  menu = Menu.new
  pizza = Dish.new('pizza',9.99)
  fish_chips = Dish.new('fish & chips', 12.00)
  menu.add(pizza)
  menu.add(fish_chips)
  order = Order.new
  order.add(pizza, 1)
  order.add(fish_chips,3) 
end

end