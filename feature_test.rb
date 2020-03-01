require './lib/takeaway'
require './lib/menu'
require './lib/order'

takeaway = Takeaway.new()

takeaway.view_menu

takeaway.add("Garlic Bread", 2)
takeaway.add("Diavola", 1)
takeaway.add("Romana", 2)
takeaway.add("Goat", 1)

puts takeaway.check("Diavola")

puts takeaway.current_order.inspect


# takeaway.check_total
# takeaway.check_out
