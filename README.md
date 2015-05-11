Takeaway Challenge
==================

# Notes on Takeaway Challenge

## Progress on User Stories

* See list of dishes with prices - complete
* Select some number of several dishes - complete
* Check that total matches sum of dishes in my order - complete (order display)
* Send an SMS message when order is placed - complete


## Class Responsibility Collaborator domain modelling

This is a first pass. There may be substantial changes for encapsulation and SRP reasons.

### Customer

Responsibilities: .new, .mobile_number, .mobile_number=, .list_orders, .list_messages

Collaborators: Order, Message

### Takeaway

Responsibilities: .new, .list_orders

Collaborators: Order, Menu, (OrderLine)

### (Menu - merged into Takeaway for simplicity)

(Responsibilities: .new, .list)

(Collaborators: MenuItem, Takeaway)

### (MenuItem - merged into Takeaway for simplicity)

(Responsibilities: .new, .price)

(Collaborators: Menu, OrderLine)

### OrderLine

Responsibilities: .new, .item_name, .item_quantity, .item_total

Collaborators: MenuItem, Order

### Order

Responsibilities: .new, .item_add, .customer, .list_order, .order_status, .order_status=

Collaborators: OrderLine, Customer, Takeaway, Message

### Message

Responsibilities: .new, .message_status

Collaborators: Order, Customer


Instructions
-------
* Challenge time: Friday, the entire day + the weekend if you need it
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (if you haven't already)
* Fork this repo
* run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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
```

* Hints on functionality to implement:
  * ensure you have a list of dishes with prices
  * place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use a Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


**Note: We are looking for good OO design and programming! Remember the Single Responsibility and Dependency Injection/Inversion principles!**

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
