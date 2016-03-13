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
Makers Academy Week 02 Weekend Challenge <br>
Author: Rhiannon Lolley Neville <br>

[![Build Status](https://travis-ci.org/rhiannonruth/takeaway-challenge.svg?branch=master)](https://travis-ci.org/rhiannonruth/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/rhiannonruth/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/rhiannonruth/takeaway-challenge?branch=master)

Task
-------
Write a Takeaway program with the following user stories:
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

Installation Instructions
-------
* Fork this repo.
* Run the command ```bundle install``` in the root directory to install dependancies.
* Visit https://www.twilio.com/ and create a free account.
* Create a ```.env``` file in the root directory to store the following variables : ACCOUNT_SID, AUTH_TOKEN, FROM_PHONE_NUMBER, TO_PHONE_NUMBER
