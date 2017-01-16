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

Domain Model
-------

Usage
-----
- Load up your favourite REPL and require 'lib/takeaway.rb'
- Create an instance of the class Takeaway. The menu will be displayed when the instance is created.
- To view the menu manually, use the command .menu
- Order using .order(item_number, quantity, total_cost)
- Add additional items to the order with the same command
- View the basket using .basket
- Checkout and place the order using .checkout
- Enter your phone number at checkout to be sent the confirmation SMS message

Example
-----

```

require 'lib/takeaway.rb'
feedme = Takeaway.new
feedme.order(1, 3, 8.70)
feedme.order(2, 3, 11.70)
feedme.order(11, 1, 7.95)
feedme.order(17, 1, 8.95)
feedme.order(20, 2, 5.90)
feedme.basket
feedme.checkout

```
