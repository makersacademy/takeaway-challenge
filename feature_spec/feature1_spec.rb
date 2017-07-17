require_relative '../lib/menu.rb'
require_relative '../lib/order.rb'

menu = Menu.new("Dominos",
"Cheese & Tomato", 6,
"Mighty Meaty", 9,
"Pepperoni Passion", 8,
"Tandoori Hot", 9,
"Vegi Sizzler", 8)

order = Order.new(menu)
puts order.read_menu
