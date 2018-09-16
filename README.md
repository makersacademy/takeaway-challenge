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

Approach
-------
I approached this challenge by creating five classes:
- A Menu class, which stores the menu
- An Order class, which creates a new order, sends and order to be printer and confirm orders. 
- A Calculator class, which calculates the total of an order
- A Printer class, which prints out the menu and the bill
- A Text class, which sends an SMS to confirm an order

How to use it
-----
To see the menu:

In irb:
require "./lib/menu"

menu = Menu.new

menu.print 


To order:
--------

In irb:
require "./lib/order"

order = Order.new

order.new_item("Duck_pancakes", 2)

order.new_item("Noodles", 1)

order.print_order

order.place_order(29)


The place_order method intends for the customer to enter what they expect the total bill for the order to be. It sends a text message to confirm the order if this is right, or raises an error if it's not right. (I wasn't sure how to interpret the instructions on placing an order, so I chose for it work like this). 



