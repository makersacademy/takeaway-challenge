restaurant = Takeaway.new
menu = Menu.new

tacos = Dish.new("Tacos", 6)
nachos = Dish.new("Nachos", 5)
burrito = Dish.new("Burrito", 8)
fajitas = Dish.new("Fajita", 9)

tacos.add_to_menu(menu)
nachos.add_to_menu(menu)
burrito.add_to_menu(menu)
fajitas.add_to_menu(menu)

menu.list_dishes
menu.add_to_order(tacos,3)
menu.add_to_order(nachos,3)
menu.add_to_order(burrito,3)

order.view_order
order.total_price
order.place_order
