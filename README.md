Takeaway Challenge [![Build Status](https://travis-ci.org/joemaidman/takeaway-challenge.svg?branch=master)](https://travis-ci.org/joemaidman/takeaway-challenge) [![Coverage Status](https://coveralls.io/repos/github/joemaidman/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/joemaidman/takeaway-challenge?branch=master)
==================
```
                            ___________
              r==           |  Joe's  |      
           _  //            |  Pizza  |   ))))
          |_)//(''''':      |  Place! |             
            //  \_____:_____.---------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Introduction
-------
This project emulates the ordering infrastructure of a take-away restaurant via the bash terminal. Users can view a menu, add items from the menu to an order, total an order and place an order and receive confirmation that an order has been placed, either by SMS (twilio api) or email (SMTP). This project was created for the second weekend challenge at Makers Academy and is designed to address four user stories (see below).

Example Usage / Set-up
-----
The main directory provides a


Gems
-----
1. <a href="https://github.com/twilio/twilio-ruby">twilio-ruby</a> (by twilio)
2. <a href="https://github.com/mikel/mail">mail</a> (by mikel)
3. <a href="https://github.com/bkeepers/dotenv">dotenv</a> (by bkeepers)

Learning Outcomes
-----
- TDD

Future Improvements
-----
- Remove items from an order
- Save an order history for each customer
- Reorder a previously placed order
- Add an address location for an order
- Add order stages (e.g.preparing, out for delivery) and update the customer

Design
-----
This program addresses the following user stories:

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
