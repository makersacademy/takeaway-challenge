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
Welcome to Parrot Pizza Parlour!


To use our order creator, run bundle install. Then simply require menu, order and message_sender.

Create a new order:

order = Order.new

To see a list of commands, type order.help

To view the menu, type order.view_menu

To add an item to your order, type order.add_item(item_no). The menu will provide you with the item number.

To delete an item from your order, type order.delete_item(item_no).

To view your order, type view_order, or if you just want to view the total cost, type order.view_total.

When you're ready to place your order, type order.place_order(phone_number starting with +44)


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
