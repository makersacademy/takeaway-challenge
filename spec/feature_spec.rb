require "dish"
require "menu"

menu = Menu.new
menu.add_dish(Dish.new("Raw Vegan Lasagna", 6))
menu.add_dish(Dish.new("Sun-Dried Tomato Truffles", 4))
menu.add_dish(Dish.new("Raw Caramel Apple Pie", 5))
menu.display
menu.new_order
menu.order("Raw Vegan Lasagna")
menu.current_order.total
menu.order("Sun-Dried Tomato Truffles")
menu.order("Raw Caramel Apple Pie")
menu.current_order.display
menu.order("Raw Vegan Lasagna")
menu.current_order.submit("07854692794")
