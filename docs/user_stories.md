As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
	Classes:  Restaurant
	Methods:  .menu

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
        Classes:   Customer, Order, Restaurant
        Methods:  order(restaurant_inst, menu_no), Order.new

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
        Classes:  Restaurant, Customer, Order
        Methods:  R.bill(order), C.check_bill(order)

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
        Classes:  Restaurant, Customer, Order
        Methods:  R.send_confirmation(order)
	Variables: O(@tel_no, @food_order)
