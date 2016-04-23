require './lib/takeaway.rb'

new_order = Takeaway.new

p new_order.show_menu
p new_order.select('curried anchovies')
p new_order.select('duck')
p new_order.order
