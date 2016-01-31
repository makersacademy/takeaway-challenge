Takeaway Challenge
==================

Introduction
-------

This project aims to create a command line takeaway restaurant simulation, in Ruby. This is a solo project created for the Makers Academy week 2 weekend challenge. Twilio API is used to implement sending of text messages to the customer, Rspec is used throughout to test all functionality, and dotenv is used to maintain privacy of Twilio account details, and related info.

Features modeled include the following:

* Ability to view the menu, with prices.
* Ability to add dishes and quantities to the order.
* Ability to view the basket at any time.
* Ability to view to total at any time.
* Ability to checkout and enter the payment price.
* A text message will be sent confirming that the delivery time will be within 1 hour.

Instructions
-------

* First open Terminal, `cd` in to the project directory and run `irb` or any similar REPL.
* Require the nexessary files using the following:
```
require './lib/takeaway'
require './lib/menu'
require './lib/order'
require './lib/output'
```
* You can now create your takeaway using...
```
takeaway = Takeaway.new
```
* Note that the Takeaway object creates a new Menu object upon initialization, which holds the list of dishes and prices. However if preferable another menu object can be created manually using...
```
menu = Menu.new
```
* ...and then passed to the Takeaway at creation time, using...
```
takeaway = Takeaway.new(menu)
```

* You can then view the menu using...
```
takeaway.show_menu
```
* To add an order from the takeaway use...
```
takeaway.add("Shish Kebab") #for example
```
* ...to add a single item, or...
```
takeaway.add("Shish Kebab", 4)
```
* ...to specify quantity too. To amend a quantity after ordering simply use `add` again with a different quantity, or use `add` with a quantity of `0` to remove the item from the order. If a dish is specified which is not listed on the menu the following error will be raised: `'Dish not available: not part of the menu'`.

* To view the basket use...
```
takeaway.show_basket
```
* ... which will list the dishes in your order, their quantities, prices and the total price. To view only the total price use...
```
takeaway.show_total
```
* To complete the order process use...
```
takeaway.checkout(10.50) # enter total price without £ sign.
```
* Where the total price must be entered correctly. If the final price is entered incorrectly the following error will be raised: `'Payment error: incorrect payment submitted'`. If the total price was entered correctly a text message will be sent confirming the delivery time, which will be 1 hour later than the order time.
