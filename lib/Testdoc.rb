require './lib/menu'

takeaway = Takeaway.new

p takeaway.prices["chicken"]
p takeaway.price_finder("chicken")
p takeaway.food[1]
p takeaway.item_list(0)
p takeaway.menu
p takeaway.order("lamb")


takeaway.order("chicken")
p takeaway.basket