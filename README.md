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




Summary
-------
This program is designed to allow you to order chosen meals from a menu. To add and delete items from your current order. To make a new and cancel an order, and when checkout is complete, sends a SMS message to tell the user the delivery will arrive within one hours time.

**Main Objectives**
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
**Safety Features**
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
**Additional Information**
This program uses the TWilio API to send a SMS message.
I have a local .env file that hides the SMS details. To use this program please register with Twilio for free and put in your own details

Summary
-------
This program is made up of four files: Dish, Menu, Order & SMS.
**Dish**
Dish is a simple class which is used to create a dish. It consist of three methods: Name, Price & Quantity.
**Menu**
Menu has the dish menu stored via an array. Menu is also used to search through the menu and return the Desired item.
**SMS**
SMS is used to send the text message via the Twilio API. It formats the message and adds in the time + 1 hour.
**Order**
This is the user interface for the program. Options to control the program are as follows:
How to manage the order itself:
new_order - will create a new order.
cancel_order - will wipe clear the current order and initiate a new_order

How to view information about your current order:
current_order - will allow the user to view the dishes they currently have on their order.
view_menu - this will show the user a complete list of the menu.
print_menu - this will show the user a more formatted user friendly menu.
total_cost - this will show the total cost of the current order.

How to adjust your current order:
add - will add an item to your current order. Please pass in the meal you wish to add as a string. E.G. my_order.add('korma')
delete - will delete an item from your current order. Please pass in the meal you wish to delete as a string. E.G. my_order.add('vindaloo')

How to complete your current order:
checkout - This will ask you to enter the total cost as a saftey feature. If this passes a text message will be sent telling the user the delivery time, total cost and items ordered.

Additional Information
-------
This program requires more work. It needs more tests around the SMS.rb. The current tests are currently in the Chicargo style testing method and needs London style tests to be added.
It also needs some changes for example to the Reduce method
