require_relative 'lib/menu'
require_relative 'lib/order'

dishes = [
{name: "Pasta", price: 3.50},
{name: "Pizza", price: 2.40}
]

order=Order.new
menu = Menu.new(dishes, order)
menu.view



order=Order.new
dish = {name: "Pasta", price: 3.50}
order.add(dish)



require './lib/user_interface'
app = UserInterface.new
app.launch!
