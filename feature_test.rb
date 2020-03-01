require './lib/takeaway'
require './lib/menu'
require './lib/order'

takeaway = Takeaway.new()

takeaway.view_menu

takeaway.add("Garlic Bread", 2)
takeaway.add("Romana", 2)

puts takeaway.current_order.fetch_price


# takeaway.check_total
# takeaway.check_out
