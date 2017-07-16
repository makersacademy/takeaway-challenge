# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the
# various dishes in my order

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

p order.add("Vegi Volcano", 2)
p order.add("Vegi Sizzler", 1)
p order.add("Tandoori Hot", 2)
p order.add("Vegi Sizzler")
p order.basket
p order.total
p order.checkout(30)
p order.checkout(34)
p order.placed?
p order.add("Cheese & Tomato")
