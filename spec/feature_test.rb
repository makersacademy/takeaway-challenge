require 'takeaway'

takeaway = Takeaway.new

#Welcome
takeaway.enter
# See menu
takeaway.display_menu
#Save menu for ease of use
menu = takeaway.menu
#Create an order
order = takeaway.create_order

#Add smth to the order
order.add(menu.dishes[0])
order.add(menu.dishes[1],2)
order.add(menu.dishes[2],3)

#print the reciept
puts order.receipt

#removing smth from the order
order.remove(menu.dishes[2],2)

#print the reciept
puts order.receipt

#place the order with too little money
order.place(1)

#place the order with the correct sum
order.place(order.total_price)
