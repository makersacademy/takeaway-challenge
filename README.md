[![Build Status](https://travis-ci.org/wrumble/airport_challenge.svg?branch=master)](https://travis-ci.org/wrumble/airport_challenge)
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg?branch=wrumble)](https://coveralls.io/github/makersacademy/takeaway-challenge?branch=wrumble)

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

 2.2.3 :001 > require './lib/order'
  => true
 2.2.3 :002 > order = Order.new
  => #<Order:0x007f81ba1b5948 @order=[], @menu=#<Menu:0x007f81ba1b58f8>, @message=#<Message:0x007f81ba1b58d0>>
 2.2.3 :003 > menu = Menu.new
  => #<Menu:0x007f81ba1ad338>
 2.2.3 :004 > menu.view




                  Bobs Cafe


 Burger                                  £5
 Chips                                   £2
 Pizza                                   £8
 Drink                                   £1



               Tip your waiters               


  => nil
 2.2.3 :005 > order.add("Burger")
  => 1
 2.2.3 :006 > order.add("Chips")
  => 1
 2.2.3 :007 > order.add("Pizza")
  => 1
 2.2.3 :008 > order.add("Drink")
  => 1
 2.2.3 :009 > order.view
  => [["Burger", 5], ["Chips", 2], ["Pizza", 8], ["Drink", 1]]
 2.2.3 :010 > order.total
  => "Current order total is £16"
 2.2.3 :011 > order.remove("Chips")
  => 1
 2.2.3 :012 > order.view
  => [["Burger", 5], ["Pizza", 8], ["Drink", 1]]
 2.2.3 :013 > order.total
  => "Current order total is £14"

Task
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

Currently doesnt send a message, keep getting an authentication error from Twilio.

cant get dot env to work so havnt fully commited to git as i cant hide some details yet.
