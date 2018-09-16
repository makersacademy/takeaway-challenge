# To install:

Clone, check Ruby version: requires 2.5.1 (or change gemfile), bundle install.

# Usage examples for user stories

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

in pry:
  require './lib/takeaway'
  food = Takeaway.new
  food.menu
    --> {"Margherita": 4.99, "Pepperoni": 6.99, "Four Cheese": 5.99, "Sausage": 6.99}

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

in pry:
  require './lib/takeaway'
  food = Takeaway.new
  food.menu
  food.order "Sausage"
    --> "1x Sausage pizza has been added to your basket"
  food.basket
    -->
  food.order "Sausage", 3
    --> "3x Sausage pizza has been added to your basket"

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

in pry:
  require './lib/takeaway'
  food = Takeaway.new
  food.menu
  food.order "Sausage", 2
  food.order "Pepperoni", 3
  food.pricecheck
    --> "2x Sausage: £xx, 3x Pepperoni: £xx"
  food.total
    --> £13.98

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

in pry:
  require './lib/takeaway'
  food = Takeaway.new
  food.menu
  food.order "Sausage", 2
  food.order "Pepperoni", 3
  food.pricecheck
    --> "2x Sausage: £xx, 3x Pepperoni: £xx"
  food.total
    --> £13.98
  food.submit_order
    --> "Your order will arrive by 19:26"

# Extra information

Works as expected in feature tests. Had some trouble implementing RSpec tests for testing text message functionality. Would like to use VCR to stop messages from sending every time tests are run. Will need to update with this once able to to do.
