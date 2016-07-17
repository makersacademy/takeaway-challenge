require './lib/menu'
require './lib/dish'

dish1 = Dish.new(data: {name: "Burger", price: 10})
dish2 = Dish.new(data: {name: "Chicken", price: 5})
dish3 = Dish.new(data: {name: "Lobster", price: 20})

menu = Menu.new

menu.add(dish1)
menu.add(dish2)
menu.add(dish3)

menu.read_menu.each_with_index{ |dish, index| puts "Dish ##{index+1}: #{dish.name} - £#{dish.price}\n" }

menu.order(dish1, 3)

menu.basket_summary