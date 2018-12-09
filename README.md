Takeaway Challenge - Curry Code House
==================

Description
-------

This is a simulation of how a fictional takeaway could use Ruby to manage its ordering process. It currently supports the following features:

* Reading the full menu
* Adding items to your order
* Checking the total cost of your current order and confirming if it is correct
* Place an order that sends a text to the user confirming delivery time (1 hour from checkout)

Installation
-----

require `'./order.rb'` in IRB

All feature tests in IRB will require you to create a new instance of the Order class using `order = Order.new`

Instructions
-----

* To display the menu run `order.show_menu`
* To add items to your order run `order.select_items(selection)` where the `selection` argument is the item names you would like as an array. To add multiples of the same item just write its name twice
* To check the total cost of your order run `order.check_total`
* To confirm your order and checkout run `order.checkout` (NOTE: The text delivery number is currently hardcoded so maybe don't run this in IRB!)

Customer stories
-----

This simulation currently meets the requirements of the below user stories:

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

API Reference
-----

Built using `Twilio-Ruby`

Tests
-----

To run the tests run RSpec from within the `takeaway-challenge` folder

Contribute
-----

Please contact @rednblack99 on Github with any feedback or suggested additions