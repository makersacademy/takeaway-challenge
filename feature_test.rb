require './lib/takeaway'
require './lib/menu'

takeaway = Takeaway.new()
puts takeaway.inspect

takeaway.view_menu
#
# takeaway.create_order
#
# takeaway.add(dish, amount)
# takeaway.add(dish, amount)
# takeaway.add(dish, amount)
#
# takeaway.check_total
# takeaway.check_out
