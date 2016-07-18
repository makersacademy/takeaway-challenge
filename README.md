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

This program enables a user to see a take-away menu, and then order dishes of desired quantity from the menu. The program will check that a dish is indeed
on the menu, and add it to the order in the given quantity.

Once a user has finished ordering, they can check that the order amount is correct and review their order. They are then given the choice if they wish to proceed with their order, and if so, once they have confirmed, they will receive a text message with details of their order and estimated delivery time.

Here is an example of how the program can be used:

 ```
require './lib/take_away'
t = TakeAway.new
t.show_menu
t.order("rice", 2)
t.order("rice", 1)
t.order("sushi set", 4)
t.order("takoyaki", 1)
t.order("nuggets", 6)
t.query_price('rice')
t.show_total
t.check_order("£59.60")
t.confirm_order('yes')
 ```

 ```
User Stories:
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

If I had more time, I would move some of the order methods currently in the TakeAway class and put them in the order class. Also, I'd reafactor some of my code in the Order class as it smells bad.

[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg)](https://coveralls.io/github/makersacademy/takeaway-challenge)
