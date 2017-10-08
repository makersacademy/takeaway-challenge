require_relative '../lib/menu'
require_relative '../lib/takeaway'
require_relative '../lib/order'

menu = Menu.new
menu.view
takeaway = Takeaway.new
takeaway.add('curry')
takeaway.add('beer')
takeaway.add('dumplings')
takeaway.add('curry')
takeaway.view_basket
order = takeaway.order
price = takeaway.total_price
takeaway.complete_order(order, price)
