require "./lib/takeaway.rb"
require "./lib/dish.rb"
require "./lib/customer.rb"
require "./lib/order.rb"

takeaway = Takeaway.new("Chutney in Putney")

dish1 = Dish.new("Chicken Rogan Josh", 600)
dish2 = Dish.new("Pilau Rice", 300)
dish3 = Dish.new("Naan Bread", 200)
dish4 = Dish.new("Aloo Saag", 500)
dish5 = Dish.new("Gobi Manchurian", 600)

takeaway.add_dish(dish1)
takeaway.add_dish(dish2)
takeaway.add_dish(dish3)
takeaway.add_dish(dish4)
takeaway.add_dish(dish5)

takeaway.return_menu

order = Order.new(takeaway)


order.add_to_order(dish1)
order.add_to_order(dish1)
order.add_to_order(dish2)
order.add_to_order(dish3)

order.get_price

order.complete_order(4)
