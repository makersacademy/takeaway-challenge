Takeaway Challenge
==================

Task
-----
User Story's for the challenge

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

Overview
-----------
This project was designed to simply allow a user to operate a simple takeaway that allows users to `list_dishes`, `add('item','qunatity')` to their order `list_order`, and `send_message` to tell them what is in their order and how much it will cost.

Installation
------------

* Fork and clone this repo
* run `bundle install`
* run `ruby takeaway.rb` in the command line

NB. This program requires a Twilio account and for the Twilio Auth Token to be stored in a users ENV variables. The receiving number also needs to be saved into an ENV variable: PHONENUMBER for this program to work.

Work still required
-------------------
* Refactor menu class to get menu from a file
* Refactor to comply with SRP
