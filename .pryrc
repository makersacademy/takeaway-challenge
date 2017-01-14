require "./lib/takeaway.rb"

pepperoni = Dish.new("Pepperoni pizza", 7.00)
hawaiian = Dish.new("Hawaiian pizza", 9.00)
meat_feast = Dish.new("Meat Feast pizza", 8.00)

menu = Menu.new(pepperoni, hawaiian, meat_feast)

takeaway = Takeaway.new(menu, MenuLister)
