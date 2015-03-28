[![Build Status](https://travis-ci.org/joejknowles/takeaway-challenge.svg?branch=master)](https://travis-ci.org/joejknowles/takeaway-challenge)

Takeaway Challenge
==================
Approach
--------
I included two extra user stories, one for editing the menu and one for validating order entries.

Use
---
In irb, require 'order' and 'send_sms'. Phone numbers and twilio API keys have been removed and must be added for full text functionality.
Add items to your order with 'order' an instance of the Order class. Then call place on an instance of Restaurant with order.list, and the total cost as arguments.
You can add items to the menu, or change their prices with restaurant.add(items_and_prices_hash).
Creating an order with items off the menu will raise an error.
Correct message is sent when the return value of retaurant.place(..) is entered as an argument to sms.send(..).

User stories
------------

```sh
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

As a restaurant owner
So that I can have an up to date menu
I would like to be able to add new items and update prices

As a restaurant owner
So that I can fulfill all orders
I would like to inform customers when they order off menu
```