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

Setup
-----

Run `bundle` to install gems

Uses twilio to send text messages: https://github.com/twilio/twilio-ruby

Details for twilio are stored as environment variables

Instructions
-------
* Use a new Takeaway object to `view_menu`, `add_to_basket` and `place_order`
* You can pass in menu items with prices as a hash when initializing a new takeaway, e.g. `{ pizza: 6, fries: 1 }`
* At the moment you can use `takeaway.basket` directly but I'd change that if I had time

User Stories
----

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
