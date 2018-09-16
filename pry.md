As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

in pry:
  require './lib/takeaway'
  food = Takeaway.new
  food.menu
    --> {"Margherita": 4.99, "Pepperoni": 6.99, "Four Cheese": 5.99, "Sausage": 6.99}

    --------------------------------------

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
  food.total
    --> £13.98

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
