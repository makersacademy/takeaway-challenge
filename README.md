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

My solution to the Takeaway Challenge. A program which allows a customer to see a menu, make an order and receive a SMS confirmation through use of the Twilio API. This is the Makers Academy homework challenge for week 2.

Objectives
---------

Continue to learn object-oriented programming and test driven development
Learn about using an API


Technologies used
------------------

* Ruby
* RSpec
* Git
* Twilio

How to run it
---------------

```
[1] pry(main)> require'./lib/takeaway'
...
[2] pry(main)> takeaway = Takeaway.new(Menu,Order,SMS)
...
[3] pry(main)> takeaway.view_menu
Curry £9
Burger £8
Pizza £10
Noodles £5
Chicken £5
Kebab £6
...
[4] pry(main)> takeaway.begin_order
...
[5] pry(main)> takeaway.add("Burger",1)
...
[6] pry(main)> takeaway.place_order(8)
```

Features
---------

* View menu
* Begin order
* Add items to order
* Check price is equal to sum of prices of dishes ordered
* If price is correct, place order
* Receive SMS confirmation
* Errors raised for inconsistent actions

References
---------------------
Used https://github.com/makersacademy/course/blob/master/pills/levels_of_stubbing.md
for testing the sending of SMS
