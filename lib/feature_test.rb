require './lib/order.rb'
require './lib/menu.rb'
require './lib/dish.rb'
require './lib/sms.rb'

kfc = Menu.new
kfc.add_dish(:chicken_wings,3.99)
kfc.add_dish(:chicken_pieces,5.49)
kfc.add_dish(:chips,2.49)

mcdonalds = Menu.new
mcdonalds.add_dish(:mcmuffin,1.99)
mcdonalds.add_dish(:chips,1.99)

order = Order.new(menu: kfc)

order.load_menu(kfc)
order.display_menu
order.take_order(:chips, 2)
order.view_current_order
order.confirm_order
