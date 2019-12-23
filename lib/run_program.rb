require_relative 'order'

menu = Menu.new

menu.add_item(Item, "pizza", 8)
menu.add_item(Item, "burger", 10)
menu.add_item(Item, "chips", 3)

order = Order.new(menu)
order.selection
order.print_selection

