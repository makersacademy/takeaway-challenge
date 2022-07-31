# Feature test to ensure program is running as expected.

require './lib/menu_entry'
require './lib/menu'
require './lib/order'

menu = Menu.new

dish1 = MenuEntry.new
dish1.add_dish("Korma")
dish1.add_price(10)

dish2 = MenuEntry.new
dish2.add_dish("Madras")
dish2.add_price(14)

menu.add_entry(dish1)
menu.add_entry(dish2)

order = Order.new

order.select_dish("Korma")
order.order_quantity(2)
p order
