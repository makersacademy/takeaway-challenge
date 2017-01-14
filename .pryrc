require './lib/order.rb'

restaurant = Restaurant.new
order = Order.new
meal = Meal.new("")
meal.select_dishes(restaurant, "chicken_tikka", "orange_juice")

#meal.select_dishes(restaurant, dish)
