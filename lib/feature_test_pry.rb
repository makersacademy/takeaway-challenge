require_relative 'lib/menu'

dishes = [
{name: "Pasta", price: 3.50},
{name: "Pizza", price: 2.40}
]

menu = Menu.new(dishes)
menu.view
