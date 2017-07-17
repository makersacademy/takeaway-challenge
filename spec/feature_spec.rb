require './lib/takeaway'
require './lib/order'

=begin - commented out as raised errors break code when running rspec

t = TakeAway.new
p t
menu = Menu.new(menu)
p menu
order = Order.new(menu)
p t.read_menu
p t.add "pork", 2
p t.add "prawns", 1
p t.add "curry", 2
p t.total
p t.place_order
=end
