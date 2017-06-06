[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

# Takeaway Challenge

## Weekend Challenge, week 2

Project done 25. - 26. March 2017
_____________________
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

* ``require "./lib/takeaway.rb"`` in IRB or Pry
* Create a new order ``takeaway = Takeaway.new``
* Check the menu ``takeaway.show_menu``
* Select the items you want to order ``takeaway.add_to_order("salad") takeaway.add_to_order("Burger") takeaway.add_to_order("Lasagna")`` You can order as many items as you want.
* Get the price of your order ``takeaway.order.total``
* Send your order to the restaurant ``takeaway.send_order``
* Finally, you (I) will receive a confirmation text message with the order.

The task as described
-----
We have received a request from a client to build an app for a takeaway restaurant that shows the menu to the customer, allows them to order, verifies the price, and sends them a confirmation text message.

Here are the user stories that we worked out in collaboration with the client.

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
