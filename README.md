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
Introduction
------------

  A Makers project to build a takeaway restaurant application. This program allows you to see a menu, order food, calculate the price and then send a message to indicate that the order is on its way

Domain Model
------------

  It would require 4 classes
    Takeaway - To view menu, view ordered items, place order, confirm total and complete order
    Order - To calculate total price for the order
    Menu - To contain Hash of menu items and prices
    Text - To send confirmation text using the Twilio API

To Use Program
--------------
- $ git clone git@github.com:sunali1/takeaway-challenge.git

Install Gems
------------
You require the following gems:

- gem 'rspec'
- gem 'capybara'
- gem 'rake'
- gem 'twilio-ruby'

To install the following gems, confirm that they are in the Gemile and then run:

- $ bundle install

(Ensure that you have bundler installed and initialized)

Run Tests
---------

- $ bundle exec rspec

User Stories
-------------

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

References:
```
