Software to replicate a food ordering service with interactive menu focusing on OOD techniques. 

The project contains 2 classes. A takeaway class that stored the information about the food available and can print the menu, and a order class which controls the current order. 

To use this code you must clone this project and run bundle. Then navigate into the takeaway-challenge folder and run irb. 
run 
require './lib/order'

initilise a new order with 

order = Order.new 

You can check the menu with order.takeaway.print_menu 

Then to choose food you can either use 
order.add_by_name('item') 
with 'item' being the name of the food item from the menu you would like to add to the order. 

You can also open the interactive menu with 

order.interactive_menu

This will allow you to continously type in the items you want until you write 'stop' to leave the menu. 

You can check what is on your current order with 

order.print_current_order

To confirm your order use 

order.confirm_order

This will print your current order and total cost along with a message saying the food will arrive at a time 1 hour in the future.

Problems - 

I worked on getting confirm_order to send a text to the persons number. However, this was not quite finished and havent yet looked into using env variables to store my number securely.
I also need to add an error message for when a item is attempted to be added to the order that isnt on the menu. 
Finally I need to refactor my tests. 
