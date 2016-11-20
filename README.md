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

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

Install
-------

* Fork this repo and clone to your machine
* Run the command `gem install bundler` (if you don't have bundler already).
* Run the command `bundle install` to install the required gems.
* Open up `irb` or `pry` to begin using the Takeaway system!

Instructions
-----

Begin by initializing a new Takeaway object.

To view the menu - `#view_menu`.

To select a dish and its quantity - `#select(<dish number>, <quantity>)`

You can select any dish any number of times.

To check what you have ordered with the prices, quantity and total cost - `#check_order`

To check just the total cost - `#total_price`

To confirm your order and receive a text confirmation - `#confirm order`

-----
**Example pry transcript**
```
[1] pry(main)> require './lib/takeaway.rb'
=> true
[2] pry(main)> takeaway = Takeaway.new(Order)
=> #<Takeaway:0x007fed0228d1a0
 @order=Order,
 @view_menu=
  {1=>{"Chicken Adobo"=>4.5},
   2=>{"Pancit Bihon"=>4.5},
   3=>{"Pancit Canton"=>4.5},
   4=>{"Sizziling Pork Sisig"=>5.0},
   5=>{"Pork Sinigang"=>5.0},
   6=>{"Sizziling Beef Sisig"=>4.5},
   7=>{"Stir Fried Vegetables"=>3.5},
   8=>{"Rice and Lechon"=>5.5}}>
[3] pry(main)> takeaway.select(1, 2)
=> 2
[4] pry(main)> takeaway.select(3, 1)
=> 1
[5] pry(main)> takeaway.select(1, 2)
=> 2
[6] pry(main)> takeaway.select(4, 2)
=> 2
[7] pry(main)> takeaway.check_order
=> {{"Chicken Adobo"=>4.5}=>4, {"Pancit Canton"=>4.5}=>1, {"Sizziling Pork Sisig"=>5.0}=>2, "Total cost:"=>"£32.5"}
[8] pry(main)> takeaway.total_cost
=> "£32.5"
[9] pry(main)> takeaway.confirm_order
=> "You should receive a text message confirming your order and delivery time."
```
-----
**Future changes to implement:**
* Implement the ability to place an order via text message.
* Update SMS stubbing - Learn how to manage network stubbing with VCR to ensure automated CI systems will avoid sending unwanted texts
