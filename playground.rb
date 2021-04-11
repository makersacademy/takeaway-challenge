require './lib/takeaway'

p order = Takeaway.new
p order.view_menu
p order.add_to_order("Seafood linguine", 30, 1)
p order.add_to_order("Pizza", 18, 1)
p order.order_total
p order.confirm_order(48)
