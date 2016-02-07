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

Implementation
--------

I created a features test file to guide my design, which consists of four classes - takeaway, menu, calculator and order. Each class has a corresponding spec file for unit tests, which are each mocked and stubbed to remove dependencies on each other, and the main class has been refactored for dependency injection. My implementation is fully functional when spiking in irb/pry, and allows for a confirmation text message to be sent via the Twilio API. This API has disabled by way of stubs in the feature and unit tests. Dotenv gem was utilized to hide the Twilio account SID and authentication tokens, and the .env file added to .gitignore. 

In my feature test, the following user stories were implemented:

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

Instructions
-------

The takeaway object is initialized with four parameters - menu, calculator, twilio, order. The public interfaces of takeaway are show_menu, select and confirm_order. Select method requires you to pass in the order as a hash - hash keys are valid dish names and the values correspond to the quantity you wish to order. The second parameter to pass is the your estimated cost. If the dishes and estimate are both valid, then an order confirmation is returned with the bill amount, and a text message is sent.

```
[6] pry(main)> takeaway = Takeaway.new(Menu.new, Calculator.new,Twilio::REST::Client.new(Dotenv.load["ACCOUNT_SID"], Dotenv.load["AUTH_TOKEN"]), Order.new)
[7] pry(main)> takeaway.show_menu
=> {:ribs=>3, :beef=>4, :rolls=>3, :chips=>2, :pies=>5}
[8] pry(main)> takeaway.select({beef: 2, rolls: 3}, 19)
=> {:beef=>2, :rolls=>3}
[9] pry(main)> takeaway.confirm_order
RuntimeError: incorrect bill amount
[10] pry(main)> takeaway.select({beef: 2, rolls: 3}, 17)
=> {:beef=>2, :rolls=>3}
[11] pry(main)> takeaway.confirm_order
=> "order confirmed: correct amount billed 17"
```

Once the order has been confirmed and the correct amount billed, the twilio API sends a text message, where delivery_time is calculated to be one hour ahead of the current time.

```
"Thank you! Your order was placed and will be delivered before #{delivery_time}"
```

Build Badge
------------------

[![Build Status](https://travis-ci.org/ggwc82/takeaway-challenge.svg?branch=master)](https://travis-ci.org/ggwc82/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/ggwc82/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/ggwc82/takeaway-challenge?branch=master)
