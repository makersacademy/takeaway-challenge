Takeaway Challenge
==================

I'm afraid I didn't get very far with this – got caught up with the other one. I haven't written the blog post or implemented the Twilio text messaging functionality. The basic design of the Takeaway class is done, however.

### lib file

**takeaway.rb** implements the `Takeaway` class. Menus are stored as hashes, with dishes as keys and prices (in pennies) as values. You can initialize a takeaway with whatever menu you like, although the default is fish, chips and peas. There are five public methods:

* `present_menu`, `present_selection` and `present_total` return strings with the menu, customer selection and total order cost respectively.
* `select_item(dish, quantity)` chooses dishes, defaulting the quantity to one.
* `place_order(payment)` places the order if the payment is correct, and throws an error otherwise.

### spec file

The spec file uses two test menus, one involving three unusual dishes, the other being black (it is used to test `present_menu` when the menu is an empty hash).

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
