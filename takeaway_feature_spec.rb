require './lib/takeaway'
require './lib/dish'

dish1 = Dish.new("Chicken Wings", 1.49)
dish2 = Dish.new("2 piece box of Fried Chicken", 2.99)
dish3 = Dish.new("Small Hamburger", 2.99)

takeaway = Takeaway.new([dish1, dish2, dish3])
takeaway.display_menu

takeaway.order("chicken wings")
takeaway.order("chicken wings")
takeaway.order("small hamburger")

takeaway.show_basket
takeaway.total
takeaway.checkout("08202918293")
