# require './lib/order.rb'
#
# restaurant = Restaurant.new
# order = Order.new
# #meal = Meal.new("")
# order.select_dishes(restaurant, "chicken_tikka", "orange_juice")
#
# meal.select_dishes(restaurant, dish)
#
# require './lib/text.rb'
#
# text = Text.new
# text.send_message

require './lib/order.rb'
res = Restaurant.new
order = Order.new
order.select_dishes(res, "chicken_tikka", "orange_juice")
