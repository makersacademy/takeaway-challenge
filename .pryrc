require './lib/order.rb'
res = Restaurant.new
meal = Meal.new
meal.select_dishes(res, "chicken_tikka", "orange_juice")
