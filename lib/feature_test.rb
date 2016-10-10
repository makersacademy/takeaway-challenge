require_relative "takeaway"

takeaway = Takeaway.new

# Welcome
puts takeaway.enter
# See menu
puts takeaway.display_menu
# Save menu for ease of use
menu = takeaway.menu
# Create an order
order = takeaway.create_order

# Add smth to the order
order.add(menu.dishes[0])
# Check it got added
order.items

# Add more things to the order
order.add(menu.dishes[1], 2)
# Check they got added
order.items
# Order even more stuff
order.add(menu.dishes[2], 3)

# print the reciept
puts order.receipt

# removing smth from the order
order.remove(menu.dishes[2], 2)

# print the reciept
puts order.receipt

# place the order with too little money
order.place(1)

# place the order with the correct sum and a tip
order.place(order.total_price + 5)
