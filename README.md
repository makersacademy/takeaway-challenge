Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Takeaway program with the following user stories:

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

Approach and Technologies used
==============================

* Language: Ruby

* Unit testing: RSpec

* Twilio API client for text messages

* DOTENV variables to hide user token credentials

Below are the four classes used in the project outlined with their responsibilities:

- **Messenger**: responsible for sending the order confirmation text messages upon order.

- **Menu**: responsible for storing dish objects. It displays the menu with a name of a dish and its price.

- **Order**: responsible for adding dishes and their quantity. as well as storing the total cost of the order.

- **Takeaway**: the scaffold of the program, responsible for displaying menu, making orders, verifying total, and sending the confirmation message upon receiving the order.

Challenges
==========

Make sure Twilio text messages were not sent during tests.


Installation
=============

* Fork this repo and clone the files to your own project directory.
* From the command  run ``` bundle install ``` This will add all the necessary gemfiles to the project directory to ensure you can run the files.


Further Features to Implement
=============================

* Develop better tests for Messenger class
* Make all the existing tests pass
* Implement the ability to place orders via text message.

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
