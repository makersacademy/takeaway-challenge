Takeaway Challenge
==================

Author: Emma Beynon

Github: https://github.com/emmabeynon

Email: emma.beynon@gmail.com


This is my submission for the Makers Academy Week 2 Weekend Challenge: https://github.com/makersacademy/takeaway-challenge

Overview
---------
This challenge involved writing a takeaway programme with the below user stories.

User Stories
------------
```
As a customer
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
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

Instructions
------------
1. Fork this repo and clone to your local machine.
2. Run ```gem install bundle```
3. Once installation is complete, run ```bundle```
4. If you do not already have a Twilio account, create an account.
5. Create a .env file in your root directory and input your "TWILIO_ACCOUNT_SID", "TWILIO_AUTH_TOKEN" and "TWILIO_SMS_NUMBER" credentials.  Make sure you add this file to .gitignore.
6. Open ```irb``` or ```pry``` from the project directory and follow the below commands:

```
> require './lib/takeaway.rb'
> require './lib/menu.rb'
> require './lib/order.rb'
> takeaway = Takeaway.new(Order)
> takeaway.create_order(Menu.new.list) # creates a new order from the menu
> takeaway.order.menu # view the menu
> takeaway.order.choose("Dish 1", 2) # choose a dish name and quantity
> takeaway.order.dishes # view the dishes you have selected
> takeaway.order.calculate_cost(takeaway.order.dishes) # calculate the cost of your order
> takeaway.order.calculate_quantities(takeaway.order.dishes) # calculate the quantity of dishes in your order
> takeaway.place_order(takeaway.order, takeaway.order.quantity, takeaway.order.total, 'your phone number') # place your order
```

Approach
---------
I started the challenge by creating a Takeaway class and following the test-driven development process using Rspec to build out methods to support the user stories.  I then started to extract the Menu and Order classes after seeing that the Takeaway class was no longer adhering to the Single Responsibility principle.  The programme now makes use of dependency injection so that the Order and Menu classes are interchangeable.
This programme uses the Twilio API in order to send a text confirming the order has been placed to the customer.


Further Work
-------------
I could use a text file instead of a class for Menu.
