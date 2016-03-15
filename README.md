Takeaway Challenge - Author Harsheet Patel
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

Instructions
-------

This software allows you to process takeaway orders and implements a sms notification system using Twilio REST API. The current written code has been designed to have four classes:
 'Order' class to process the order
 'Menu' class to show the list of the available dishes
 'Dish' class for the dish name and price
 'SMS' class which has the Twilio client functionality to send the text message.

 To run:
 run `bundle`

 Create a menu:
 `kfc = Menu.new`

 Add dishes to the menu:
 `kfc.add_dish(:chicken_wings,2.99)` (name,price as arguments)
 `kfc.add_dish(:chicken_wings,2.99)`

Create order:
`order1 = Order.new` (Order is initialized with no menu so can loaded or dishes can be added within)

Load a menu:
`order1.load_menu(kfc)`

Add to a menu: (useful if no menu)
`order1.add_a_dish(:chips,1.99)` (name,price as arguments)

View menu:
`order.see_menu`

Add dish order:
`order.take_order(:chips,5)` (name,quantity as arguments)

Place order:
`order.place_order(amount_given)`

User stories
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


Build
------------------

[![Build Status](https://travis-ci.org/hkp108/takeaway-challenge.svg?branch=master)](https://travis-ci.org/hkp108/takeaway-challenge)
