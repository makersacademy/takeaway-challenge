# Takeaway challenge (23rd-24th June)

Makers Academy week 2 weekend challenge. A takeaway application was developed which can show the user a menu, take orders, calculate a sub_total, confirm a total price, and send a text confirmation of delivery using the Twilio API.

# User Stories

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

# Tech
Ruby with Rspec for unit tests & irb for feature tests.

# Usage

The following commands can be run;
```
menu = Menu.new # creates an instance of the menu class.
takeaway = Takeaway.new(menu) # creates an instance of the takeaway class with the menu passed through.

takeaway.print_menu # shows the menu.
takeaway.add_to_basket('chicken', 2) # adds two chicken burritos to the order.
takeaway.sub_total # contains the current order split by filling type.
takeaway.total_price # confirms the final cost and sends the confirmation text.
```

NOTE: text.rb has assigned the twilio information to environment variables. In order to for the text functionality to work you will need to sign up to a twilio account and export your account information to your local computer assigning using the same variables names.

Example running in IRB
```
> require './lib/takeaway'

> menu = Menu.new
> takeaway = Takeaway.new(menu)
2.5.0 :006 > takeaway.add_to_basket('chicken', 3)
2.5.0 :007 > takeaway.add_to_basket('pork', 2)
2.5.0 :008 > takeaway.sub_total
2.5.0 :009 > takeaway.total_price
```

## Text example
```
Sent from your Twilio trial account - Thank you for your order. Total cost: £38.5. Your order will be delivered before 9:21.
```

# Further Improvements
Needs to be refactored to make it cleaner.
Basket could be separated out into a new class.
Need to add mocks/stubs so that twilio doesn't send a text each time the tests are run.
