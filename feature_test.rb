require './lib/takeaway'
require './lib/menu'
require './lib/order'

takeaway = Takeaway.new()

takeaway.view_menu

takeaway.check_total
takeaway.complete_order
