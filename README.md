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

Description
-------
* I took care of preserving the ASCII art this time.

* I have 4 classes: controller, order, menu, dish.
* The Dish class represent..a dish. It has methods to return its name, and its price per portion.
* The Controller class is the 'shop' itself, greeting the customer and taking care of communications
* The Controller knows about the menu of the day (Menu class) which has methods to show the dishes available in a human-readable form, and in an actuall array
* The Controller gets also loaded with a Order class, and creates new instances when greeting a customer
* When a dish is added by selecting its corresponding number on the list and the amount wanted, it gets stored in the order and the total bill update_order
* There is a call to show (in human format) the current open order and the total due so far, to be able to pay the correct amount.
* Once done, a user can call #checkout and pay (the right amount!) and receive a confirmation message + text. It is possible to insert a new order.

Notes
-------
* This time around I went for a 'make it work first, refactor later'. While I found this easier, I'm not sure it's the best approach, as I have a feeling my code is not as clean or good. This Weekend I had very little spare time, so that adds to the noise.
* Following on that, I didn't manage to clean up the rspec, so magic numbers and overly long lines everywhere.
