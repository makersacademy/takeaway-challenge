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

Instructions
-----
Run the command `bundle` in the project directory to ensure you have all the gems

`require './lib/order'`

`require './lib/menu'`

`require './lib/confirmation'`

`today_menu = Menu.new`

`text = Confirmation.new`

`new_order = Order.new(today_menu, text)`

`new_order.print_menu`

`new_order.add_dish("salad")`

`new_order.completed_order("salad", 1)`

`new_order.payment(5)`

Use `Rspec` to test

## Overview

Place the order by giving the list of dishes and their quantities. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 30 minutes from now. "Thank you! Your order was placed and will be delivered before Hour:Min".

The text sending functionality implemented using Twilio API.

When Takeaway is loaded into IRB and the order is placed, the text will be sent

For the project testing purpose use personal mobile phone number.

User stories:
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
