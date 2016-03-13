Takeaway Challenge
==================

The challenge consists of four user stories with the functionality of:
* A customer being able to see a list of dishes with prices;
* A customer being able to select a number of several dishes;
* Being able to check the total being given matches the sum of various dishes in the order;
* Receive a confirmation text message saying that the order has been place and will be delivered at a certain time.

How I went about this challenge:
--------------------------------

I started off with by feature testing what I wanted to happen, writing unit tests and then implementing code in a takeaway class to pass those tests.
Once I got down to a user ordering dishes I created a new order class (and relevant spec) which adds those items to their basket and calculate the price.
To implement the Twilio API SMS function I added that to a third class called checkout. When the user calls the checkout method in the takeaway class, this calls a method called send_sms in the checkout class. The send_sms method sends a confirmation message to the user. The order is also closed when the user calls the checkout method in takeaway.

Test coverage:
--------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

When writing the tests for the Twilio function I had to stub the ENV variables. The tests pass, however it now gives ``` warning: already initialized constant ENV```. This somehow causes an error in the coveralls.
However when checking the relevant file in the coveralls folder the coverage currently stands at 95.15%.
