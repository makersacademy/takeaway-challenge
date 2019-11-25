require_relative 'takeaway.rb'
require_relative 'menu.rb'
require_relative 'order.rb'

t = Takeaway.new
o = Order.new
o.show_menu
o.add_to_basket(4)
o.add_to_basket(4)
o.add_to_basket(1)
t.submit_order(o, 17.97)
