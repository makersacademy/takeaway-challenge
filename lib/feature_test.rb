require_relative 'order'
require_relative 'menu'

order1 = Order.new
p order1.menu
order1.place_order({name: 'sushi', amount: 5},{name: 'ramen', amount: 1}, 28)
p order1.total
p order1.basket << "order"

menu = Menu.new
menu.find_price({name: 'sushi', amout: 5})
