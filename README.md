# Takeaway Challenge
[![Build Status](https://travis-ci.org/lsewilson/takeaway-challenge.svg?branch=master)](https://travis-ci.org/lsewilson/takeaway-challenge)


## Description

This program is a simulation of a restaurant takeaway system, where a customer can order food from a specified menu and expect to receive the correct charge for the food.
The customer can confirm the order by entering the correct payment amount and will receive a confirmation text via Twilio.

## Set Up Instructions

1. Clone the repo.
2. Install the relevant gems by running 'bundle install'.
3. Update .env.example file with your Twilio account information and rename file as .env.
4. Require 'takeaway.rb' in IRB or Pry.

## How to use

1. Create a new takeway order.

    `order = Takeaway.new`

2. View the takeaway menu.

    `order.view_menu`

3. Add items to the order.

    `order.add_to_order("Cheese Burger", 2)`
    `order.add_to_order("Onion Rings", 1)`

4. Review order to find out order total.

    `order.review_order`

5. Checkout and pay for order.

    `order.checkout(21.50)`

6. Receive confirmation text via Twilio!

## Feature Test

```
$ irb
2.3.1 :001 > require './lib/takeaway'
 => true
2.3.1 :002 > order = Takeaway.new
 => #<Takeaway:0x007fed49230378 @menu=#<Menu:0x007fed49230350 @dishes={"Beef Burger"=>8.5, "Cheese Burger"=>9, "Honest Burger"=>10.5, "Tribute Burger"=>10.5, "Special Burger"=>12.5, "Chicken Burger"=>9.5, "Fritter Burger"=>7.5, "Onion Rings"=>3.5, "Coleslaw"=>3, "House Salad"=>3}>, @basket={}>
2.3.1 :003 > order.add_to_order("Honest Burger")
 => 1
2.3.1 :004 > order.add_to_order("Tribute Burger", 2)
 => 2
2.3.1 :005 > order.add_to_order("Onion Rings", 1)
 => 1
2.3.1 :006 > order.add_to_order("Coleslaws", 1)
RuntimeError: This item is not on the menu
2.3.1 :007 > order.add_to_order("Coleslaw", 1)
 => 1
2.3.1 :008 > order.review_order
Honest Burger x 1: £10.5
Tribute Burger x 2: £21.0
Onion Rings x 1: £3.5
Coleslaw x 1: £3
Total: £38.0
 => nil
2.3.1 :009 > order.checkout(28)
Total: £38.0
RuntimeError: Please enter correct payment amount
2.3.1 :010 > order.checkout(38)
Total: £38.0
```


## More Information

### Classes

There are three classes used in this program.

1. Takeaway
2. Menu
3. SMSConfirmation

#### 1. Takeaway

* Properties

  * `menu` the menu that is initialized with the takeaway.
  * `basket` all the items selected in the order
  * `total` the total cost of the items in the order

* Methods

  * `view_menu` allows the user to view formatted menu
  * `add_to_order` allows the user to add items to their basket
  * `review_order` allows the user to view an order summary and check subtotals and totals
  * `checkout` allows user to pay for order and fails if payment amount does not equal basket total. Triggers new confirmation text if payment is accepted.

#### 2. Menu

* Properties

  * `menu` a hash of all menu items and their prices

* Methods

  * `check_menu` raises an error if the user tries to add an invalid item to their basket
  * `price` returns the price of a menu item

#### 3. SMSConfirmation

* Methods

  * `send_text` sends a given message to a customer telephone number from a Twilio account.
