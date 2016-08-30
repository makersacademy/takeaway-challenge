require './lib/menu'
require './lib/dish'
require './lib/order'

dish1 = Dish.new(data: {name: "Burger", price: 10})
dish2 = Dish.new(data: {name: "Chicken", price: 5})
dish3 = Dish.new(data: {name: "Lobster", price: 20})

menu = Menu.new

menu.add(dish1)
menu.add(dish2)
menu.add(dish3)

order = Order.new(menu: menu)

order.read_menu.each{ |dish| puts "#{dish.get_name} - £#{dish.get_price}"}

order.select_dish("Burger", 2)
order.select_dish("Chicken", 3)
order.select_dish("Lobster", 1)

p order.basket_summary

# order.place_order(50)
puts order.place_order(55)