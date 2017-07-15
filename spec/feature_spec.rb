require "dish"
require "menu"

menu = Menu.new
5.times { menu.add_dish(Dish.new("Raw Vegan Lasagna", 6)) }
menu.display
menu.new_order
menu.order("Raw Vegan Lasagna")
menu.current_order.total
menu.order("Raw Vegan Lasagna")
menu.current_order.display
