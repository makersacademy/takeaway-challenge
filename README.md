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

The end goal of the Takeaway Challenge is to build a program that users can use to order a takeaway via text message. Once their order is placed they will receive a confirmation text with their order details. The API used is Twilio.


Current state of this program is that a customer is able to see a list of dishes with with their respective prices.


Approach
--------

* So far I have 3 separate classes for 3 objects. Menu, Order, and Takeaway.


User Story
----------
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

Instructions with IRB
---------------------
:001 > require './lib/takeaway.rb'
 => true
2.2.3 :002 > require './lib/menu.rb'
 => true
2.2.3 :003 > require './lib/order.rb'
 => true

 ...

 Create new menu with dishes

 menu = Menu.new("patties" => 2, "ackee" => 5)

Further functions to implement
------------------------------
Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".

The text sending functionality should be implemented using Twilio API. You'll need to register for it.

Use the twilio-ruby gem to access the API

Use the Gemfile to manage your gems
Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run

However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent


Author: Douglas Rose
