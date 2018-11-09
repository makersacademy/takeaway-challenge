require './lib/takeaway'
require './lib/dish'

dish1 = Dish.new("chicken wings", 1.49)
dish2 = Dish.new("2 piece box of fried chicken", 2.99)
dish3 = Dish.new("Small hamburger", 2.99)

takeaway = Takeaway.new([dish1, dish2, dish3])
takeaway.display_menu

takeaway.order("chicken wings")
takeaway.order("2 piece box")

puts takeaway.basket
