Takeaway Challenge
==================
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
 Approach
__________

This challenge is to create a takeaway app, where you can order food and receive a text message saying thank you and when your order will be delivered. It has been written in Ruby and tested with RSpec.

My final design includes classes of Menu, Order, Messenger and Dish. Dishes are added with a name and price and are then added to a menu. An order can add items from the menu with a quantity and which will create a sum of the prices of each item. Once the order has been verified, the customer will receive a text message confirming the order and a delivery time which is one hour from the order confirmation.

Process
________

The approach to this challenge has been through many different designs as I changed my interpretation of the User Stories. By approaching the challenge with a mind for avoiding having to extract classes later on, it was difficult to choose which design to use. To begin with, I had a Takeaway and User class but eventually decided that they were not neccessary to my design.

Feature Test
____________
A Margherita pizza dish is created and added to a menu. An instance of messenger is created for an order. The order adds 2 Margherita pizzas and the total of the order is £13.

2.2.3 :005 > marg_pizza = Dish.new(name: 'Margherita', price: 6.50)
 => #<Dish:0x007fa851b1b3d0 @name="Margherita", @price=6.5>
2.2.3 :006 > menu = Menu.new(dishes: marg_pizza)
 => #<Menu:0x007fa851b10de0 @dishes=[#<Dish:0x007fa851b1b3d0 @name="Margherita", @price=6.5>]>
2.2.3 :007 > messenger = Messenger.new
 => #<Messenger:0x007fa851b08488>
2.2.3 :008 > order = Order.new(menu: menu, messenger: messenger)
 => #<Order:0x007fa851af2d18 @dishes_ord=[], @menu=#<Menu:0x007fa851b10de0 @dishes=[#<Dish:0x007fa851b1b3d0 @name="Margherita", @price=6.5>]>, @messenger=#<Messenger:0x007fa851b08488>>
2.2.3 :009 > order.add(marg_pizza, 2)
 => [{:dish=>#<Dish:0x007fa851b1b3d0 @name="Margherita", @price=6.5>, :quantity=>2}]
2.2.3 :010 > order.total_order
 => 13.0


Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
