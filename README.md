Takeaway Challenge [![Build Status](https://travis-ci.org/amaalali/takeaway-challenge.svg?branch=master)](https://travis-ci.org/amaalali/takeaway-challenge)
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

Usage Test
-------

```sh
[1] pry(main)> require './lib/restaurant'
=> true
[2] pry(main)> bobs = Restaurant.new
=> #<Restaurant:0x007fc9899bf0f0 @current_order=[], @menu=[{:dish=>"fries", :price=>1.0}, {:dish=>"fish", :price=>1.5}], @total=0>
[3] pry(main)> bobs.read_menu
1. fries ... £1.0
2. fish ... £1.5
=> "To add an item to your cart type 'resturant_name.select(item_number, quantity)'"
[4] pry(main)> bobs.select(1,3)
=> [{:dish=>"fries", :price=>1.0, :quantity=>3}]
[5] pry(main)> bobs.select(2,1)
=> [{:dish=>"fries", :price=>1.0, :quantity=>3}, {:dish=>"fish", :price=>1.5, :quantity=>1}]
[6] pry(main)> bobs.cart
Your cart has the following:
3 x fries = £3.0
1 x fish = £1.5
=> [{:dish=>"fries", :price=>1.0, :quantity=>3}, {:dish=>"fish", :price=>1.5, :quantity=>1}]
[7] pry(main)> bobs.total
=> "Your total is £4.5"
[8] pry(main)> bobs.place_order
```
