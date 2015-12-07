
![makersacademy](media/ma_logo.png)

**week 2 / weekend challenge**

# The challenge

This weekend challenge is to create a simple takeaway app where users can view dishes from a menu, select some and place an order.
[Twilio REST API](https://www.twilio.com/docs/api/rest) should be used to send via SMS the order confirmation.
:spaghetti::wine_glass:

## User stories

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

# Implementation

[![Build Status](https://travis-ci.org/allimac/takeaway-challenge.svg?branch=master)](https://travis-ci.org/allimac/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/allimac/takeaway-challenge/badge.png)](https://coveralls.io/r/allimac/takeaway-challenge)

## Modules & gems

* yaml
* twilio-ruby

## PRY code-flow

```
[1] pry(main)> require './lib/order.rb'
=> true
[2] pry(main)> menu = Menu.new
...
[3] pry(main)> menu.view
=> "// MENU // -- appetisers --  Olives £2 / Hummus £1.5 / -- mains --  Beef £7 / Chicken £6 / -- desserts --  Sorbet £3 / Tart £4 /"
[4] pry(main)> order = Order.new
...
[5] pry(main)> order.add("Beef", 3)
=> [{:name=>"Beef", :price=>7, :qty=>3}]
[6] pry(main)> order.add("Sorbet", 1)
=> [{:name=>"Beef", :price=>7, :qty=>3}, {:name=>"Sorbet", :price=>3, :qty=>1}]
[7] pry(main)> order.review
=> "Your order: 3x Beef £7, 1x Sorbet £3. Total price: £24"
[8] pry(main)> order.place
=> "Order placed. You will get an SMS with the delivery time soon!"
```


## Classes

### Menu

Menu allows to view all dishes and find dishes from a .yml file. A different file to read the menu from can be passed as argument (the file is located in lib/resources/).
```
menu = Menu.new('pizza_restaurant.yml')
```
It receives the following messages:
* view menu
* find(dish)

### Order

Order allows to store added dishes, review the order with the total price, and place the order. Every instance of Order instantiate a Menu as well (a default menu is passed as argument to menu class).
When the order is placed an SMS is created and the message send is called on it.
It receives the following messages:
* add(dish, qty)
* review
* place

### Sms

Sms allows to send an SMS using [Twilio REST API](https://www.twilio.com/docs/api/rest) passing the method the delivery time.
It receives the following messages:
* send(delivery_time)


## Data

* A .yml file in /lib/resources stores all the menu data
* Twilio tokens are stored in a .gitignored .yml file


## Future improvements

* stub the send_text method so that the sms is not sent when testing
* refactor find, print_menu methods for Menu class
* prevent user from adding the same dish and just increase its qty
* reset order after is succesfully placed
* allow users to order via SMS
* improve refactoring
