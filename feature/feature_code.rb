
chicken = Dish.new("chicken", 2.99)
beef = Dish.new("beef", 3.49)
pizza = Dish.new("Pizza", 5.00)
fries = Dish.new("Fries", 1.99)
menu = Menu.new()
menu.add_dish(chicken)
menu.add_dish(beef)
menu.add_dish(pizza)
menu.add_dish(fries)
takeaway = Takeaway.new(menu)
takeaway.print_menu
takeaway.add(chicken, 3)
takeaway.add(fries, 5)
takeaway.total
takeaway.receipt
takeaway.confirm_order
