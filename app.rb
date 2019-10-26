require './lib/takeaway.rb'
require './lib/menu.rb'
require './lib/order.rb'

mochi_shop = Takeaway.new(menu: Menu.new)

p mochi_shop.show_menu

order = Order.new

p order.select("DAIFUKU", 3)
p order.select("ICHIGO", 3)

p mochi_shop.order_summary(order.selection)

cjorder = Order.new
cjorder.select("ICHIGO", 1)

mochi_shop.order_summary(cjorder.selection)

# p mochi_shop.submit_order
