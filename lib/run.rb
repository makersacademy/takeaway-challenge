require './lib/takeaway'
require './lib/menu'
require './lib/order'

takeaway = Takeaway.new
takeaway.ascii_render
takeaway.interactive_menu
