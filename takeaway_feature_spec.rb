require './lib/takeaway'
require './lib/dish'

dish1 = Dish.new("Chicken Wings", 1.49)
dish2 = Dish.new("2 piece box of fried chicken", 2.99)

takeaway = Takeaway.new([dish1, dish2])
takeaway.display_menu
