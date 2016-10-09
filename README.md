#Takeaway Challenge#

##Week 2 - Weekend Challenge##
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

User stories
-------

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

Our challenge this weekend was to make a "Take Away Application"

A Simple take away application that takes user orders and sends text messages with their order information and when it will be delivered via Twilio API.


Program Features

- Listing of dishes with prices
- Users are able to place orders by choosing dishes from the menu, their quantities and confirming the total cost. If the sum provided by the user is not correct, an error is raised.
- If the total cost provided is correct, the customer is sent a text confirming the order was placed successfully and that it will be delivered 1 hour from the time of order
- The text sending functionality was implemented using the Twilio API
- A Gemfile must be used to manage gems
- Mocks were used to prevent texts from being sent when tests are run

Technologies used

`Ruby
RSpec
Twilio`


How to use

In irb:
`require ./lib/takeaway.rb`

How to test

`git clone https://github.com/codepreneur/takeaway
cd takeaway
rspec`

https://travis-ci.org/fmlharrison/takeaway-challenge.svg?branch=master
