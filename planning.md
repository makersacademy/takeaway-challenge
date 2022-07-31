<!-- As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered -->

# Planning

- List of dishes with prices can be represented using a hash { dish: Burger, price: 10 }
- Alternatively, this can be done by creating a Dish class that stores the name and price of the dish in question

Menu initialized with empty menulist
Add menu items to menulist
Selecting menu items to be put into order should instantiate new dish class instances with the name and price of the item selected

To check order total, I will need to iterate through the list of order items and make sure that quantity * price for each dish sums indeed match the order total 