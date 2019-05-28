require './lib/takeaway'
require './lib/order'
require './lib/menu'
require './lib/twillo_text'

takeaway = Takeaway.new

takeaway.display_menu

takeaway.ordered_items(:curry, 2)
takeaway.ordered_items(:pizza, 2)

takeaway.place_order(21)