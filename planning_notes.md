# User Story 1

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

# Plan 1

- IRB

Create an instance of takeaway

call the method menu on the takeaway 

I expect this to return a list of dishes with prices.

- Other 

I think Takeaway should be a class

menu will be a variable which houses a hash.

the hash is the menu items as keys, values are the prices.

see_menu prints this hash line by line

# User Story 2

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

# Plan 2

- IRB

create a takeaway instance

run see_menu

choose an item i want

this adds it to a basket

choose another item

this also adds it to a basket

i want to see my basked

- How i do this

so we will have a variable basket

a method order which take a argument 

the argument should be a key of the menu hash 

the basket stores this choice, both the item and price

Order should be a seperate class.

I need to add a functionality of checking if item already on list and changing the order summary to show 2 x item.

# User Story 3

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

# Plan 3

- IRB 

Create an instance of order. 

Add items to the basket 

run the method total to see what the cost is.

check if matches the sum of the various dishes.

# User Story 4

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

# Plan 4

- IRB 

Create an instance of order 

Add items to the basket 

Checkout the order when im done

Get a message confirming the order through text.