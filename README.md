[![Build Status](https://travis-ci.org/michaellennox/takeaway-challenge.svg)](https://travis-ci.org/michaellennox/takeaway-challenge)

Takeaway Challenge
==================

How I Worked
----

I aimed to complete this challenge in a test driven manner, using automated feature and unit tests with rspec. I would convert each individual user story into a failing feature test and then work on each individual segment as a new failing unit test. I have aimed to commit every test cycle so you can view my process.

I have tried to encapsulate my code as much as possible throughout. The user should be interacting with Takeaway at all times, the owner can make modifications to the menu before initializing the takeaway.

Installation Instructions
----

Running the Program
----

###For Restaurant Owner

Create your menu, add any dishes you want then initialize the takeout system.

Each item is added to the menu with `.add_item(:item_name, cost)`. To check your current menu call `.dishes`. You can remove items from your menu with `.remove_item(:item_name)`.

Once happy with the menu initialize your takeout with your menu as an argument.

```
$ irb
2.2.3 :001 > load './lib/takeaway.rb'
 => true
2.2.3 :002 > menu = Menu.new
 => #<Menu:0x007faaca198648 @dishes={}>
2.2.3 :003 > menu.add_item(:beef, 2.43)
 => 2.43
2.2.3 :004 > menu.add_item(:lamb, 4.32)
 => 4.32
2.2.3 :005 > menu.add_item(:stew, 2.11)
 => 2.11
2.2.3 :006 > menu.dishes
 => {:beef=>2.43, :lamb=>4.32, :stew=>2.11}
2.2.3 :007 > takeout = Takeaway.new(menu: menu)
 => #<Takeaway:0x007faaca13a1b0 @menu=#<Menu:0x007faaca198648 @dishes={:beef=>2.43, :lamb=>4.32, :stew=>2.11}>, @order_klass=Order, @current_order=#<Order:0x007faaca139fa8 @list={}>, @checkout=#<Checkout:0x007faaca13a020>>
```

###For Restaurant Customer

The customer can then order items with `.order(:item_name, quantity)`, they can review their current order with `.basket_summary` and see their running total with `.basket_total`. Once finished, they can checkout with `.basket_checkout(payment)` but it is important to note they need to make the payment equal to the total. If they try to pay the wrong amount it will fail and tell them the correct total.

```
2.2.3 :008 > takeout.order(:stew, 2)
 => 2
2.2.3 :009 > takeout.order(:lamb)
 => 1
2.2.3 :010 > takeout.order(:beef, 5)
 => 5
2.2.3 :011 > takeout.basket_summary
 => "2x stew = £4.22, 1x lamb = £4.32, 5x beef = £12.15"
2.2.3 :012 > takeout.basket_total
 => "£20.69"
2.2.3 :013 > takeout.basket_checkout(20.33)
RuntimeError: Cannot be accepted, you need to pay £20.69
2.2.3 :014 > takeout.basket_checkout(20.69)
 => nil
```

Brief
----

Write a takeaway program with the following user stories.

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

Potential Future Tasks
----

* Add functionality to allow menu loads from file instead of manual input
