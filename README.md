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

Task
-----

* Write a Takeaway program with the following user stories:

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

How to use
-----
Create a new instance of a takeaway, then following commands can be used:

takeaway = Takeaway.new
takeaway

.show_menu
Shows the menu

.add_to_order()
Selects dishes on the menu. They can be passed as arguments e.g. add_to_order(:"Soft Drink)

.current_order.view_order
Allows you to see your current order.

.finalize_order
Will place the order and send you a text comfirming your order.

```
Improvements
-----
Improve data storage of dish items

Consideration of encapsulation and the usage of more private methods 

Improve readability while keeping code dry.

How to view the current order implementation could be cleaner

Finalize order- Would ideallly like to actually recieve a text message- this may require a paid twilio account.

Additional Features
-----
Allow a customer to edit their order.

