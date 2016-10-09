Takeaway Challenge
==================

[![Build Status](https://travis-ci.org/LaszloBogacsi/takeaway-challenge.svg?branch=master)](https://travis-ci.org/LaszloBogacsi/takeaway-challenge)
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

-- Notes --

you can create a new restaurant
can view the menu (which has to be created first)
the restaurant can take your order via the take_orders(food, quantity) method.
the dish has to be indicated by its place in the array (for the moment)
you can view the basket invoking the order.orderlist method.
to checkout you have to call the verify_order(sum) method with the correct sum in the argument.

-- Further development possibilities --

* Create a Menu class which handles the menu from a csv file so the dishes are not hardcoded in the restaurant class.
* Display a "pretty" menu list.
* At placing the order can call a dish by its name rather then the place its taking in the list.
* Price display with £ sign and nicer output in IRB.
* Separate the messaging API from the Restaurant class to      fulfil the single responsibility principle.
* Improve the time calculating method focusing the correct (local) timezones.
