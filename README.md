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
-------

* Use IRB to require the order.rb file
* Create a new instance of Order to be able to use the takeaway.
* Create a new instance of Menu to be able to see the menu.

* Use the show_menu method to see what's available at the takeaway.

* The pick_item menu is passed an item from the menu and a quantity to add items to your order.
* The order_summary method will show a simplified view of your order, including the total so far.

* When you're ready, call the place_order method to submit your order.
  - A text will be sent to your phone number with a summary and expected delivery time.


User stories fulfilled
--------
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