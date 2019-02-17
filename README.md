# Takeaway Challenge

Solution to the Makers Takeaway Challenge - original spec: https://github.com/makersacademy/takeaway-challenge

## Approach

This solution is written in Ruby, and designed to be run in IRB.

## Context

This program imitates a takeaway restaurant dealing with orders from a customer, and sending them a confirmation message when they place an order.

This program is intended to be used in irb.

## instructions

In this program you'll need to explicitly create instances of `Shop` and `Order` classes.

The `Shop` class has a `show_menu` method to allow users to look at available meals. The `add_to_order` method takes 3 arguments - the order you've created, the item as a string, and the quantity (optional - defaults to 1). This will update details on the order.

The `Order` class has the `show_summary` method to show users the details of their order, and `place_order` to confirm the order.

The `place_order` method creates a new instance of a `Messenger` class and attempts to send a message to a user. To do this you'll need to have 4 environment variables:
* A Twilio account SID
* A Twilio authentication token
* A Twilio number to send messages from
* A verified number to receive messages to

## Next steps

There's still some things left to be done on this project, time-permitting, including:
* a method to remove/reduce items from orders
* refactoring
* more robust testing on the messenger.rb file
* more robust way to check order totals are correct, and raise errors if not
