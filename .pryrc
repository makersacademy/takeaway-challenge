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

require './lib/restaurant.rb'
res = Restaurant.new
res.create_new_menu("test")
