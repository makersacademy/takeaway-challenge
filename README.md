Tadas' Takeaway
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


To get started in 'irb'
-----------------------
```
require './lib/takeaway'
t = Takeaway.new
t.load_dishes             # loads menu from 'menu.csv'
t.menu                    # prints a nice menu on the screen
t.add_dish id, qty        # add selected dish to order
t.add_dish id, qty        # remove selected dish from order
t.order_total             # get sum total of the order
t.order                   # spy upon the order items
t.place_order             # place_order and send me a confirmation sms :D
```

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge/builds/166291323)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/builds/8255233)
