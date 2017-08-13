require "./lib/order.rb"
require "./lib/menu.rb"
require "./lib/app.rb"
order1 = Order.new
order1.add_order("Lobster", 2)
order1.add_order("Pizza", 4)
order1.add_order("Halloumi")
order1.add_order("Salmon", 2)
order1.edit_selection("Halloumi", 3)
order1.remove_selection("Lobster")
order1.order_list
order1.order_total
order1.show_basket
order1.complete_order(55.0)
order1.complete_order(57.0)
