require './lib/goods.rb'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/orderlist.rb'
require './lib/restaurant.rb'

food1 = Food.new("Garlic Bread", 4, :starter)
food2 = Food.new("Olives", 2, :starter)
food3 = Food.new("Halloumi Fries", 4, :starter)
food4 = Food.new("Margherita Pizza", 8, :main)
food5 = Food.new("Caesar Salad", 8, :main)
food6 = Food.new("Ice Cream Sundae", 6, :dessert)
drink1 = Drink.new("Beer", 4, true)
drink2 = Drink.new("Cola", 3, false)

test_restaurant = Restaurant.new

[food1, food2, food3, food4, food5, food6, drink1, drink2].each do |item|
  test_restaurant.menu.add(item)
end 
test_restaurant.orders.new_order
