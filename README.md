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

Task
-----
Week 2 challenge at Makers Academy: Create a Takeaway program with text sending functionality implemented using Twilio API.
Here are the user stories for this challenge:
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
Approach
-----
I created three classes: 
- Takeaway: used to show menu and place order
- Menu: used to print the menu
- Order: used to select dishes and calculate total
- Message: used to send message to customer with estimated delivery time implemented with Twilio API

Usage 
-----


Status
-----
[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg?branch=mohamedIssaq)](https://coveralls.io/github/makersacademy/takeaway-challenge?branch=mohamedIssaq)
