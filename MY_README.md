MY_README

This program is my attempt at the Makers Academy Takeaway challenge. These were the user stories:

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

My program has three classes with different methods living on them:

* Restaurant class

[#load_menu (pass in an instance of Menu class)] allows you to load a menu
[#choose (pass in the dish name and quantity)] allows you to select a dish and quantity
[#total] adds up the total of your order and
[#pay (pass in an instance of Payment class)] takes you to the payment stage

* Menu class

Initialized with a hash of different dishes.
[#display_menu] prints the list of dishes and prices

* Payment class

[#confirm] sends the confirmation text detailing when the order will be delivered

Sensitive details i.e. phone numbers are stored in a .env file.

Here are some instructions to show you how to interact with the file in IRB:

```
2.5.0 :001 > require './lib/restaurant.rb'
 => true
2.5.0 :002 > resto = Restaurant.new
 => #<Restaurant:0x00007f936134cff0 @order=[]>
2.5.0 :003 > resto.load_menu(menu = Menu.new)
 => #<Menu:0x00007f9362007f88 @dishes={"char sui buns"=>1.0, "taiwanese rice"=>5.0, "bibimbap"=>4.0}>
2.5.0 :004 > menu.display_menu
 => ["Char sui buns, Price 1.0", "Taiwanese rice, Price 5.0", "Bibimbap, Price 4.0"]
2.5.0 :005 > resto.choose("char sui buns", 2)
You ordered 2 char sui buns
 => [["char sui buns", 1.0], ["char sui buns", 1.0]]
2.5.0 :006 > resto.choose("bibimbap", 1)
You ordered 1 bibimbap
 => [["char sui buns", 1.0], ["char sui buns", 1.0], ["bibimbap", 4.0]]
2.5.0 :007 > resto.total
 => "Your total order will cost 6.0"
2.5.0 :008 > resto.pay(payment = Payment.new)
 => #<Payment:0x00007f93608a1a60>
2.5.0 :009 > payment.confirm
 ```
