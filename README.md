
![makersacademy](media/ma_logo.png)

**week 2 / weekend challenge**

# The challenge

This weekend challenge is to create a simple takeaway app where users can view dishes from a menu, select some and place an order.
[Twilio REST API](https://www.twilio.com/docs/api/rest) should be used to send via SMS the order confirmation.

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
[1] pry(main)> require './lib/menu.rb'
=> true
[2] pry(main)> menu = Menu.new
=> #<Menu:0x007fb8b29acd48 @order=#<Order:0x007fb8b29acd20 @dishes=[], @number_dishes=0, @total=0>, @order_klass=Order>
[3] pry(main)> menu.view
=> "// MENU // -- appetisers --  Olives £2 / Hummus £1.5 / -- mains --  Beef £7 / Chicken £6 / -- desserts --  Sorbet £3 / Tart £4 /"
[4] pry(main)> menu.select("Beef")
=> [{:name=>"Beef", :price=>7, :quantity=>1}]
[5] pry(main)> menu.select("Sorbet")
=> [{:name=>"Beef", :price=>7, :quantity=>1}, {:name=>"Sorbet", :price=>3, :quantity=>1}]
[6] pry(main)> menu.order.review
=> "Your order: 1x Beef £7, 1x Sorbet £3, Total price: $10"
[7] pry(main)> menu.order.place
=> true
```


## Classes

### Menu

Menu allows to view dishes from a data source and add them to a takeaway order specifying their quantity.
Every instance of Menu has its own instance of the dependent class Order.
It receives the following messages:
* view menu in readable format
* select(dish, quantity)

### Order

Order allows to store added dishes, review the order with the total price, and place the order.
When the order is placed an SMS is sent via [Twilio REST API](https://www.twilio.com/docs/api/rest) calculating the approximate arrival time (based on number of dishes added plus delivery time).
It receives the following messages:
* add(dish_w_quantity)
* review
* place


## Data

* A .yml file in /lib/resources stores all the menu data


## Possible improvements

* reset order after is succesfully placed
* allow users to order via SMS
* improve refactoring
