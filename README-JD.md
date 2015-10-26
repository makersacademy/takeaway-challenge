#Takeaway-challenge: my plan

##User story

###First block: displaying menu

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

We need to create a menu object (Class) whose responsibilities/functionalities could be as follows:
-have a (default) list of dishes: a hash is an appropriate structure to store dishes with name as key and price as value
-allow to display menu in a well formatted manner
-allow to `#add_dish` to the list by providing name and price
-allow to `#remove_dish` from the list by providing name

##Second and third block: placing an order

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

We need to create an order object, whose responsibilities/functionalities could be as follows:
-allow to `#select` dishes from the menu by providing dish name and quantity: order could be stored in a hash and a message indicating price to pay could appear
-allow to check that the dish is available on the menu through a '#dish_available?` method
-`#submit_order` by indicating payment amount: if such amount does not match sum (checked by a `right_amount` method), an error message should appear  

##Fourth block: sending a message

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

We need to create a restaurant class whose responsibility could be:
-to get menu as an instance of the Menu class through dependency injection at initialization
-to `#confirm_order`
-resetting the order through `#order reset` once order is closed in order to take a new order
-`#send_message` by text message

In order to avoid too many dependency injections text message can be handled by a Message module included in the Restaurant class.

Order can also be a module of the Restaurant class.
