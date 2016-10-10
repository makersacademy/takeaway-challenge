#Takeaway Challenge
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

[![Build Status](https://travis-ci.org/fbell123/takeaway-challenge.svg?branch=master)](https://travis-ci.org/fbell123/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/fbell123/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/fbell123/takeaway-challenge?branch=master)

##Work report

Menu includes printing a list of all the items available and the price of those items, as well as raising an error if an item is chosen that is not on the available items.

###Working example

```ruby
[1] pry(main)> require './lib/order'
=> true
[2] pry(main)> order = Order.new
=> #<Order:0x007fd57205f0b0
 @basket={},
 @menu=
  #<Menu:0x007fd57205f060
   @item=
    {:Chinese=>7.5,
     :Indian=>8.0,
     :Vietnamese=>6.0,
     :Italian=>12.0,
     :KFC=>4.5}>>
[3] pry(main)> order.select_item("KFC", 2)
2 x KFC has been added to your basket
=> nil
[4] pry(main)> order.confirm
Your selection is:
2 x KFC = £4.5 per dish
Total cost: £9.0
=> nil
```
