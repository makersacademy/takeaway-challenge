User Stories for Takeaway Challenge

Possible Classes
	Order Platform (shows list of what is on menu, contains list of what customer wants to buy)
	Menu (containing list of dishes with prices)
	Dishes (here are all the dishes we have)

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
	Customer is able to view list of dishes from menu
	What are we expecting here? That we have a menu class, that this menu class contains a list of all of it's elements/dishes alongside their prices?

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
	Customer can select multiple dishes from the menu to order
	

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
	Customer is told the price of each of their dishes alongside the sum total of each in their 'basket'

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
	Text is sent out via Twilio to the customer thanking them for their order and telling them when their dinner will arrive