require_relative './lib/takeaway.rb'

new_order = Restaurant.new

# p new_order.place_order("baked anchovies",5)
# p new_order.balance

p new_order.show_menu
p new_order.add_to_order(3,"sushi")
p new_order.check_total
p new_order.check_total
