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
----

The task for this weekend challenge was to simulate a takeaway food app using the Twilio API. This challenge was designed to reinforce principles learned in week 2 of Makers such as single-responsibility principle and mocking, as well as TDD and OOP. This code currently has 100% test coverage and raises 0 offences with rubocop.

User Stories
------------

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

Approach
--------
When approaching the user stories, I created a diagram of objects and messages and how I thought they would interact with each other. I decided my approach would be to create a Menu class, a Meal class, and an Order class. The Menu class would be responsible for holding the menu data, and would be able to pretty print the menu.

The Meal class would be responsible for keeping a record of the all the currently selected dishes, adding and removing them when necessary, and would be able to calculate the price based on the currently selected dishes.

The Order class would be be able to add dishes, remove dishes, check the order, check the price, and complete the order, sending a text. The aim was to have the Order class be able to complete this functionality simply by calling methods on the Meal, rather than having any of its own specific algorithms.

I believe I managed to achieve what I set out to create, however if I were to improve upon my code, I would make a separate class for the price, and I would test more edge cases.

In regards to the twilio implementation, due to the use of sensitive information, I used the gotenv gem to create ENV variables for this information that were saved to a .env file which I added to the .gitignore file. 

Instructions
------------

- Create a new instance of the Order class with no arguments to have a default meal and menu upon instantiation.

my_order = Order.new

- Add a dish of choice, with a quantity by using the choose method.

my_order.choose(selection, quantity)

- Likewise, remove a previous dish with a quantity using the remove method.

my_order.remove(selection, quantity)

- Check the current order as a pretty string by using the current_order method.

my_order.current_order

- Check the current price of your order using the price method.

my_order.price

- To order the meal, run the checkout method with the amount to pay. This will send you a text confirming your order and giving the time of delivery.

my_order.checkout(payment)
