# Takeaway Challenge
[![Build Status](https://travis-ci.org/lsewilson/takeaway-challenge.svg?branch=master)](https://travis-ci.org/lsewilson/takeaway-challenge)


## Description

This program is a simulation of a restaurant takeaway system, where a customer can order food from a specified menu and expect to receive the correct charge for the food.
The customer can confirm the order by entering the correct payment amount and will receive a confirmation text via Twilio.

## Instructions

1. Clone the repo
2. Run 'bundle install'
3. Require the takeaway.rb file in IRB or Pry

## Classes

There are three classes used in this program.

1. Takeaway
2. Menu
3. SMSConfirmation

### 1. Takeaway

* Properties

  * `menu` the menu that is initialized with the takeaway.
  * `basket` all the items selected in the order
  * `total` the total cost of the items in the order

* Methods

  * `view_menu` allows the user to view formatted menu
  * `add_to_order` allows the user to add items to their basket
  * `review_order` allows the user to view an order summary and check subtotals and totals
  * `checkout` allows user to pay for order and fails if payment amount does not equal basket total

### 2. Menu

* Properties

  * `menu` a hash of all menu items and their prices

* Methods

  * `check_menu` raises an error if the user tries to add an invalid item to their basket
  * `price` returns the price of a menu item

### 3. SMSConfirmation

* Methods

  * `send_text` sends a given message to a customer telephone number from a Twilio account.

## Feature Test
