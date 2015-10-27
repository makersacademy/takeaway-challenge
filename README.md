Takeaway Challenge
==================

Instructions
-------
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (if you haven't already)
* Fork this repo
* run the command 'bundle' in the project directory to ensure you have all the gems
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
RSPec tests have not been updated after changes in the production code.

This is how an app can be used:
-------------------------------
```
2.2.3 :001 > require './lib/menu'
 => true
2.2.3 :002 > require './lib/order'
 => true
2.2.3 :003 > require './lib/messenger'
 => true
2.2.3 :004 > require './lib/takeaway'
 => true
2.2.3 :005 > kyotoya = Takeaway.new
2.2.3 :006 > kyotoya.open_menu
  => #<Takeaway:0x007f91b28d5d60 @menu=#<Menu:0x007f91b28d5d10 @dishes={"chicken gyoza"=>4.0, "singapore fried noodles"=>7.0, "salmon maki"=>5.5, "kimchi"=>3.0, "vegetable tempura"=>7.0, "beef soup ramen"=>6.5}>, @order=#<Order:0x007f91b28d5c98 @basket={}>, @messenger=#<Messenger:0x007f91b28d5bf8>>
2.2.3 :007 > kyotoya.add_to_order("kimchi", 3)
 => "3x kimchi(s) added to your basket."
2.2.3 :008 > kyotoya.add_to_order("salmon maki", 4)
 => "4x salmon maki(s) added to your basket."
2.2.3 :009 > kyotoya.order_summary
kimchi x3 = £6.00, salmon maki x4 = £22.00
2.2.3 :010 > kyotoya.total
 => "Total: £28.00"
2.2.3 :011 > kyotoya.checkout(28)
 => "Thank you! Your order was placed and will be delivered before 10:54."
```

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
