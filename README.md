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
* This is a takeaway shop simulator. At first you will be greeted with a small prompt listing some commands
* Use #list_dishes to be returned a string with the available dishes
* Use #update_order dish_id , amount to add a certain amount of a given dish to the current order
* Use #outstanding_order to get a recap of the current order and a subTotal
* Use #checkout amount_in_pounds to pay the bill and receive a confirmation text
* #welcome sets up a new order once paid. It also works to scrub the order clean at any moment and start over, but that's a secondary effect that could be changed/removed in future

Description
-------
[![Build Status](https://travis-ci.org/lorenzoturrino/airport_challenge.svg?branch=master)](https://travis-ci.org/lorenzoturrino/airport_challenge)
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg?branch=mohamedIssaq)](https://coveralls.io/github/makersacademy/takeaway-challenge?branch=mohamedIssaq)

* I took care of preserving the ASCII art this time.

* I have 4 classes: controller, order, menu, dish.
* The Dish class represent..a dish. It has methods to return its name, and its price per portion.
* The Controller class is the 'shop' itself, greeting the customer and taking care of communications
* The Controller knows about the menu of the day (Menu class) which has methods to show the dishes available in a human-readable form, and in an actual array
* The Controller gets also loaded with a Order class, and creates new instances when greeting a customer
* When a dish is added by selecting its corresponding number on the list and the amount wanted, it gets stored in the order and the total bill update_order
* There is a call to show (in human format) the current open order and the total due so far, to be able to pay the correct amount.
* Once done, a user can call #checkout, pay (the right amount!) and receive a confirmation message + text. It is possible to insert a new order.

Notes
-------
* This time around I went for a 'make it work first, refactor later'. While I found this easier, I'm not sure it's the best approach, as I have a feeling my code is not as clean or good. This Weekend I had very little spare time, so that adds to the noise.
* Following on that, I didn't manage to clean up the rspec, so magic numbers and overly long lines everywhere.
* While I'm somewhat happy with the state of the Dish, Order and Menu class and the fact that the last 2 don't depend on each other, I feel like the Controller class is a bit too bloated and untidy.
* Another big problem is line length, I find it hard to have both explicative names and test and keep in the 80 limit without doing some funky stuff that I think would impact on readability (and thus negate the desired effect)
