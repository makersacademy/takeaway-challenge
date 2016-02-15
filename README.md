Takeaway Challenge
==================

Introduction
-------

This project aims to create a command line takeaway restaurant simulation, in Ruby. This is a solo project created for the Makers Academy week 2 weekend challenge. Twilio API is used to implement sending of text messages to the customer's mobile phone, Rspec is used throughout to provide feature and unit test functionality, and dotenv is used to maintain privacy of Twilio account details, and related info, by keeping such information on a locally stored file which is .gitignore'd.

Features modeled include the following:

* Ability to view the menu, with prices.
* Ability to add dishes and quantities to the order.
* Ability to view the basket at any time.
* Ability to view to total at any time.
* Ability to checkout and enter the payment price.
* A text message will be sent confirming that the delivery time will be within 1 hour.

Instructions
-------

* Open Terminal, and clone the repository locally using `git clone https://github.com/barrygrubb/takeaway-challenge.git`.
* `cd` in to the project directory and use the `bundle` command to install all required dependencies.
* Run `irb` or any similar REPL, and require the necessary files using the following:
```
require './lib/takeaway'
require './lib/menu'
require './lib/order'
require './lib/output'
```
* You can now create your takeaway. Note that to create the takeaway the Twilio dependency needs to be injected, as shown below...
```
takeaway = Takeaway.new(Twilio::REST::Client.new(account_sid, auth_token))
```
* In order to maintain privacy of Twilio API codes, plus phone numbers used, dotenv has been implemented. Firstly ensure that there is a .env file at the root of the project folder, and that it it's contents are similar to that shown below..
```
ACCOUNT_SID="xxx" # insert account_sid
AUTH_TOKEN="xxx" # insert auth_token
TO="xxx" # insert to phone number
FROM="xxx" # insert from phone number
```
* A takeaway can now be called using the following...
```
takeaway = Takeaway.new(Twilio::REST::Client.new(Dotenv.load["ACCOUNT_SID"], Dotenv.load["AUTH_TOKEN"]))
```
* ...which will read the values from the .env file, negating the need to store the values within the source code. Note that the Takeaway object creates a new Menu object upon initialization, which holds the list of dishes and prices. However if preferable another menu object can be created manually using...
```
menu = Menu.new
```
* ...and then passed to the Takeaway at creation time as its second argument, such as...
```
takeaway = Takeaway.new(Twilio::REST::Client.new(Dotenv.load["ACCOUNT_SID"], Dotenv.load["AUTH_TOKEN"]), menu)
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
