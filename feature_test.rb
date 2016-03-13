require './lib/takeaway'

takeaway = Takeaway.new

p takeaway.read_menu

takeaway.new_order
takeaway.add_to_order("pizza")
takeaway.add_to_order("chips")

p takeaway.order_price

# takeaway.finalize_order(3)

p takeaway.finalize_order(5)
