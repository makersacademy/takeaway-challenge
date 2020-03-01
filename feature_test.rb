require './lib/takeaway'
require './lib/menu'
require './lib/order'

takeaway = Takeaway.new()
puts takeaway.inspect

takeaway.view_menu

takeaway.add("Garlic Bread", 2)
takeaway.add("Romana", 1)
takeaway.add("Padana", 1)

puts takeaway.current_order.inspect
# takeaway.add(dish, amount)
# takeaway.add(dish, amount)
# takeaway.add(dish, amount)
#
# takeaway.check_total
# takeaway.check_out
