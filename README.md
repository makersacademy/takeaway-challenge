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

Overview
-------

The takeaway challenge involves creating a program to allow a user to print a menu,
order several dishes from that menu and then complete the order receiving a text
message as confirmation.

Installation
------------

Clone this repo to your machine and run bundle to install the necessary Gems.

A sample menu is included but to create a new one simply create a csv named after
the takeaway you would like to use. Each item should be followed by its price on seperate
lines. The header should be Item, Price. This csv should be placed in the root directory
of the program installation location and will be loaded automatically upon initialising
the takeaway.

You will need the following environment variables configured referencing the account SID
and Auth Token of your twilio account (free sign up at https://www.twilio.com).

The number is the number given to you by twilio and the client is the phone number
of the test client. For production use the number can be pushed as an argument to
override this.

set NUMBER=+44xxxxxxxxxx
set CLIENT=+44xxxxxxxxxx
set SID=yyyyyyyyyyyyyyyyyyyyyyyyy
set TOKEN=yyyyyyyyyyyyyyyyyyyyyyyyy

Running the application
-----------------------

To initialise the takeaway:

`Takeaway.new(takeaway_name)``

To view the menu:

`Takeaway.show_menu`

To order an item:

`Takeaway.order(item, quantity)``

To check your total matches:

`Takeaway.check_total(your_total)``

To complete the order:

`Takeaway.complete_order(your_total)``

User Stories
-----

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
