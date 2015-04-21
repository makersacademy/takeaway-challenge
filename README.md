[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

Takeaway Challenge
==================

The fifth program I built during my programming bootcamp at [Makers Academy](http://www.makersacademy.com/). 

Objective
------------

The objective was to write a Takeaway program with the following user stories:

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

The technologies used include:

* [Twilio API](https://www.twilio.com/sms) via the [Twilio-ruby gem](https://github.com/twilio/twilio-ruby)
* [RSpec](http://rspec.info/)
* [Rubocop](http://batsov.com/rubocop/)
* [Rake](https://github.com/ruby/rake)

How to use
--------------

* Fork and clone this repo
* Navigate to the cloned directory in terminal
* Fire up IRB: `$ irb`
* Require the files: `> require './lib/menu'` and `> require './lib/text_confirm'`
* Create a menu: `m = Menu.new`
* Select some dishes: `m.select_dishes :(your chosen dish)`

|    Dish       |   Price (£)  |
| :-----------: | :-----------:|
| Cheese Burger | 3.00         |
| Hamburger     | 2.00         |
| Chips         | 1.50         |
| Coke          | 1.00         |
| Water         | 0.80         |

* Check the total price: `m.price`
* Place your order: `m.order`
* Create an instance of the confimation text: `t = TextConfirm.new`
* Prepare the confirmation message: `t.format_order m`
* Finally, send off the confimation text: `t.send_order`