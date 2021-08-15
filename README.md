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
- Before beginning the challenge, I took the time to research concepts such as abstract vs concrete classes to ensure the program was built in line with best practices.
- I then used Jam Board to map out the whole story of the order sytem, menu and text message.
- Once I was happy with the key concepts and model, I coded the program using TDD. First I wrote a failing unit test and then wrote the method to pass the test. I followed the red, green, refactor process.
- I made sure my methodss/tests covered all of the user stories plus the edge cases.
- I also ensured that I got 100% test coverage.

How to use this program
-------
- Create an instance of the 'Menu' object and call the 'show_menu' method on this instance. This will show you the menu (with prices) in the terminal.
- Create an instance of the 'Order' object and then call the 'add_item' method, passing in menu and your selection as arguments.
- You can then call the 'items' and 'value' methods on your order instance to see what you have ordered as well as the order value.
- Finally, you can call the 'place_order' method on you order, to receive a text message confirming delivery time.
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