Takeaway Challenge
==================

This is the challenge for the second weekend at Makers Academy, the goal was to build a system that emulates a takeaway with the following requirements

1. Customer can see the menu
2. Customer can select some food from the menu
3. Customer receives a bill
4. Customer receives a confirmation by text message with expected delivery time on it.

On this system we have three classes as follow:

* Takeaway, which responsibilities are:
    1. Provide the menu for the customer
    2. Receive order from the customer
    3. Provide a bill for the customer

* Menu, which responsibilities are:
    1. Provide menu with available dishes
    2. Keep a list of different dishes

* Send_SMS, which responsibilities are:
    1. Receive customer phone number and name
    2. Create and send a text message confirmation to customer phone number


Below you have an example of how to run the whole application on irb.


![Takeaway example](/Users/willibaur/Dropbox/Course/WK-02/IRB_Example.png)

You need to inject Takeaway class with two classes of a type Menu and Send_SMS within a hash

When asking for text confirmation you need to provide customer details within a hash (phone number needs to be validated first on twilio, at the moment only my phone number is validated, WIP about how to validate any number automatically)

User Stories provided
=====================

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

Testing by using rspec
=======================================

`user/username/takeaway/rspec`


Resources
=========

I designed this solution by myself, I did not copy any other solution available on the web.

I only used as external resource Twilio documentation
