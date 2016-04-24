require './lib/takeaway.rb'
require './lib/menu.rb'
require './lib/order.rb'

 t = Takeaway.new
 t.read_menu
 t.order(:king_burger, 3)
 t.order(:cheese_burger)
 t.order(:chicken_burger, 2)
 t.order(:cheese_burger)
 t.basket
 t.qty_tracker
 t.summary
