require './lib/takeaway'
require './lib/menu'
require './lib/order'

takeaway = Takeaway.new()

takeaway.view_menu

takeaway.add("Garlic Bread", 2)
takeaway.add("Romana", 2)

takeaway.complete_order

# takeaway.check_total
