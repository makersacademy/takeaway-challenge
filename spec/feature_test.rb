require_relative '../lib/order'

dish1 = Dish.new('pasta', '10')
dish2 = Dish.new('beans', '5')
menu = Menu.new
menu.add_dish(dish1)
menu.add_dish(dish2)
menu.list_dishes
order = Order.new
order.add_to_order(dish1)
order.add_to_order(dish2)
order.view_order_summary