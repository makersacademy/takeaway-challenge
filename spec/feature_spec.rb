require "dish"
require "menu"

menu = Menu.new("Ravenous Rabbit Raw Vegan Eatery")
menu.add_dish(Dish.new("Raw Vegan Lasagna", 6, "Main course"))
menu.add_dish(Dish.new("Sun-Dried Tomato Truffles", 4, "Starter"))
menu.add_dish(Dish.new("Raw Caramel Apple Pie", 5, "Dessert"))
menu.display
menu.order("Raw Vegan Lasagna")
menu.current_order.total
menu.order("Sun-Dried Tomato Truffles")
menu.order("Raw Caramel Apple Pie")
menu.current_order.display
menu.current_order.submit("07854692794")
