This is the code for the Takeaway Challenge. It was submited on August the 3rd, 2015.

The code can acomplish the requirements given in the four user stories available. In order to see this the following must be done:

1) Run irb in terminal
2) require './lib/customer'
3) Initialize a new customer (e.g. gaby = Customer.new)
4) See the available menu for pizzas and drinks ( gaby.show_pizzas(Menu) and gaby.show_drinks(Menu)). N.B. Class methods were used in this step thinking that the code could be used for other menus. These prices were taken from Franco Manca (because it's really good).
5) Choose pizzas and drinks. There is a method for pizza and a method for drinks, both of them receive two arguments, the quantity and the item required (e.g. gaby.pick_pizza(3, "Margarita"), gaby.pick_drinks(2, "White wine (750ml)"))
6) Place the order by writing gaby.place_order

N.B.
* The .show_pizzas and .show_drinks menus call the Menu class, so they need to be run before the other methods.
* An attemp to send a message with the time using Twilio was done and failed. I'll request a one to one session for this and other problems that may arise with this submission. However, it may be interesting to have a talk about Twilio during the week. The attemp can be seen in customer.rb in the commented lines. 

