# Takeaway Challenge

[![Build Status](https://travis-ci.org/aabolade/takeaway-challenge.svg?branch=master)](https://travis-ci.org/aabolade/ttakeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/aabolade/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/aabolade/takeaway-challenge?branch=master)


```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Features
========

Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the order is placed successfully, the customer is sent a text message, such as "Thank you! Your order was placed and will be delivered before  6.22pm".

User Stories
============

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
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 6.52pm" after I have ordered
```


Approach and Technologies used
==============================

* Code written in Ruby.

* Unit testing using RSpec.

* Twilio API client for SMS service. Read the documentation [here](https://www.twilio.com/docs/api/rest/sending-messages) 

* DOTENV variables to hide user token credentials.

Below are the four classes used in the project outlined with their responsibilities:

- **Dish**: responsible for new instances of dishes. There are two readable properties; the name of the dish and its price.
- **Menu**: responsible for storing dish objects. Dishes can be added or removed from the menu.
- **Order**: responsible for adding dishes and their quantity. Also keeps track of the total cost of the current order.
- **Takeaway**: responsible for producing new orders, and submitting finished orders, verifying if the customer has paid the correct amount.

One challenge to overcome was making sure Twilio sms messages are not sent during tests. Overcame this challenge by creating a ```granted_permission?``` method which decided whether the Twilio message could be sent. The default is set to true, so stubbing this response to false ensures texts are not sent.  

Instructions and Installation
=============================

* Fork this repo and clone the files to your own project directory.
* From the command  run ``` bundle install ``` This will add all the necessary gemfiles to the project directory to ensure you can run the files.

Run the following in a REPL

```
$ irb
[1] > dish = Dish.new("chicken tikka masala",4.2)
[2] > stock = DishInventory.new
 => #<DishInventory:0x007fb9c125ae90 @dishes=[]>
[3] > stock.add_dish(dish)
 => [#<Dish:0x007fb9c12b00e8 @name="chicken tikka masala", @price=4.2>]
 [4] > manager = OrderManager.new(stock)
 => #<OrderManager:0x007fb9c191a0c8 @inventory=#<DishInventory:0x007fb9c125ae90 @dishes=[#<Dish:0x007fb9c12b00e8 @name="chicken tikka masala", @price=4.2>, #<Dish:0x007fb9c194bf88 @name="Pad Thai", @price=1.2>, #<Dish:0x007fb9c1941628 @name="Sushi", @price=4.4>, #<Dish:0x007fb9c128a848 @name="Fish and Chips", @price=5.2>, #<Dish:0x007fb9c12794a8 @name="Nandos", @price=5.2>, #<Dish:0x007fb9c1268298 @name="Dominoes", @price=5.3>]>>
 [5] > order = manager.create_order
 => #<Order:0x007fb9c1910988 @current_order=[]>
 [6] > order.add_dish(dish2,3)
 => [{:dish=>#<Dish:0x007fb9c194bf88 @name="Pad Thai", @price=1.2>, :quantity=>3}]
[7] > order.add_dish(dish4,2)
 => [{:dish=>#<Dish:0x007fb9c194bf88 @name="Pad Thai", @price=1.2>, :quantity=>3}, {:dish=>#<Dish:0x007fb9c128a848 @name="Fish and Chips", @price=5.2>, :quantity=>2}]
[8] > manager.submit_order(order,14)
 => "Message sent"
```

Further Features to Implement
=============================

* Implement the ability to place orders via text message.
