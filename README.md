This is my final submission for the Makers Academy Week 2 Challenge

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

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

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
```

User Guide
-----

User Guide
-----

### Start

To start the program run the following in the terminal:
```
irb -r ./lib/runfie.rb
```

### User
You will be asked to enter your name and phone number

### Make a Selection
A menu will then appear, select a number to perfom the action

1 - Shows the menu
2 - Allows you to add an item to the order
3 - Allows you to remove an item from the order
4 - Shows the order
5 - Completes the order

### 1 Show the Menu
The default menu is created from items in the 'menu.csv' fie which can be edited. The items are formatted and printed onto the screen with id, name, and price. Each item is split into a category which is defined in the csv file.

### 2 Add Item
You will be prompted to select an item by its menu id number, then the quantity. This will be added to the current order.

### 3 Remove Item
You will be prompted to select an item by its menu id number, then the quantity. This will be removed from the current order.

## 4 Show Order
The current order will be printed to the screen. The quantity, name, price for each item will be displayed along with the the total cost of the order.

## 5 Complete the Order
This will complete the order, you will recieve a text confirming the delivery time on the phone number given.