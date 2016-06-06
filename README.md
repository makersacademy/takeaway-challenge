Takeaway Challenge
==================
This challenge is unfinished as I ran out of time to work on it. The first three user stories has been implemented and I ran out of time while reading the documentation about the Twilio gem to implement the fourth story

Current functionality:

Ability to create a menu and add to it
(e.g menu = Menu.new, menu.add(chicken, 3.50)

Ability to create a takeaway object, and either have it generate a new menu or use an existing menu
(e.g takeaway = Takeaway.new)

Ability to add objects from the menu to a "basket" in the takeaway object.
(e.g takeaway.order(chicken, 4)

Ability to see the subtotal of all items in your basket, returned as a string.
(takeaway.subtotal)

Ability to view a summary of your full order, along with the subtotal of current order
(takeaway.total)

To be implemented:
  Ability to recieve a text on completion of your order informing you of expected delivery time



User Stories

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


Notes on Test Coverage
------------------

Current test coverage is 100%

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
