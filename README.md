Takeaway Challenge
==================
[![Build Status](https://travis-ci.org/eripheebs/takeaway-challenge.svg?branch=master)](https://travis-ci.org/eripheebs/takeaway-challenge)
[![Coverage Status](https://coveralls.io/github/eripheebs/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/eripheebs/takeaway-challenge?branch=master)

What it does (With code examples)
-----
You can create dishes with names and prices and menus which can store dishes:
```
irb
2.2.3 :006 > menu = Menu.new
 => #<Menu:0x007fd191819e98 @menu=[]> 
2.2.3 :007 > curry = Dish.new(name: "Curry", price: 7)
 => #<Dish:0x007fd192a61a38 @name="Curry", @price=7> 
2.2.3 :008 > doughnut = Dish.new(name: "Doughnut", price: 2)
 => #<Dish:0x007fd192a18f90 @name="Doughnut", @price=2> 
2.2.3 :009 > menu.add(curry)
 => [#<Dish:0x007fd192a61a38 @name="Curry", @price=7>] 
2.2.3 :010 > menu.add(doughnut)
 => [#<Dish:0x007fd192a61a38 @name="Curry", @price=7>, #<Dish:0x007fd192a18f90 @name="Doughnut", @price=2>] 
```
You can create your own takeaway:
```
2.2.3 :011 > doughnuts_and_curry_house = Takeaway.new(menu)
 => #<Takeaway:0x007fd1929c27d0 @menu=#<Menu:0x007fd191819e98 @menu=[#<Dish:0x007fd192a61a38 @name="Curry", @price=7>, #<Dish:0x007fd192a18f90 @name="Doughnut", @price=2>]>, @order_klass=Order, @order=#<Order:0x007fd1929c2780 @baske=[]>, @messenger_klass=Messenger, @messenger=#<Messenger:0x007fd1929c26e0 @account_sid="----------", @auth_token="---------", @from_phone="--------", @client=<Twilio::REST::Client @account_sid=----------->>> 
```
You can order items that are on the menu:
```
2.2.3 :013 > doughnuts_and_curry_house.select_item(doughnut)
 => 1 
```
You can order more then one of the item at a time:
```
2.2.3 :014 > doughnuts_and_curry_house.select_item(doughnut, 2)
 => 2 
```
If you try to order an item not on the menu you get an error:
```
2.2.3 :012 > doughnuts_and_curry_house.select_item(sandwhich)
RuntimeError: sandwhich is not on the menu.
```
You can confirm order against the total you expect:
```
2.2.3 :018 > doughnuts_and_curry_house.confirm_order(8)
(It sends a text to your phone!)
```
If the order does not match the total you expect you will get an error message:
```
2.2.3 :017 > doughnuts_and_curry_house.confirm_order(2)
RuntimeError: Does not match total of 8
```

How I interpreted the User Stories:
-----
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
1. I need a takeaway class where I can access the menu from and order food
2. I need a menu class, which will log all the dishes.
3. I need a dish class, which will store the dish's name and cost.
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
1. I need an order class.
2. I need a method to add items to the basket in the order that must be called by a method in the takeaway class.
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
1. I need a confirm order method in the takeaway class where you pass through an argument and it checks if it is the same.
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
1. I need a messenger class
2. The confirm order method will send a text if the argument passed through matches the order total.

Installation Instructions
-----
- Fork the repo
- Clone the repo to your computer: git clone [repo url]
- Install bundle gem
- Write an .env file in the root directory with your own Twilio account details

Author
-----
Erika Pheby