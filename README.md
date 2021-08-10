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

This is the week 2 challenge as part of the Makers Academy bootcamp. It is a program built in Ruby that enables to
planes to order take-away food from a menu and get a text with the delivery time of the food.

Prerequisites
-------
- You have installed Ruby

How to install
-------

1. Fork this repo, and clone to your local machine.
2. Run the command `gem install bundler` (if you don't have bundler already).
3. When the installation completes, run `bundle`.

Building the program
-------
**complete**


How to use this program
-------
**complete**


-------
Below is an example of how to use the program:
```
items = [{ "Chicken burger" => 10 }, { "Vegan Soup" => 5 }, { "Chang Beer" => 3 }]

menu = Menu.new(items)
print menu.show_menu
order = Order.new
order.add_item(menu, 2)
order.add_item(menu, 1)
order.items
order.value
order.place_order

```
User Stories
---------
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