Takeaway Challenge
==================

`````
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


`````

[![Build Status](https://travis-ci.org/seanhawkridge/takeaway-challenge.svg?branch=master)](https://travis-ci.org/seanhawkridge/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/seanhawkridge/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/seanhawkridge/takeaway-challenge?branch=master)

The Task
--------

Write a Takeaway program that allows a user to view a menu, select some items, confirm the details of their order, place their order and receive a confirmation text (using the Twilio api).

My Approach
-----------

I worked through the user stories to understand the classes and methods the program might need. Aiming the develop the program using TDD, I wrote failing tests and then designed methods to pass them.

I built a Restaurant class that handles orders, a Menu class that provides a hash of items and prices, and a Text class that uses the Twilio api to send a confirmation text.

I used the dotenv ruby gem to prevent pushing sensitive info (auth keys, phone numbers etc) to github.

I also added some feature tests to make sure the classes interacted with each other.

The solution functions in IRB like so:

`````

[4] pry(main)> uncle_alis = Restaurant.new
=> #<Restaurant:0x007fc5f23aac68
 @menu=
  #<Menu:0x007fc5f23aac40
   @menu_list={"Chicken Tagine"=>5.0, "Meatball Tagine"=>5.0, "Lentils"=>3.0, "Bread"=>0.5}>,
 @messager=
  #<Text:0x007fc5f23aaba0
   @account_sid="***",
   @auth_token="***",
   @client=<Twilio::REST::Client @account_sid=***>>,
 @order={}>
[5] pry(main)> uncle_alis.display_menu
=> {"Chicken Tagine"=>5.0, "Meatball Tagine"=>5.0, "Lentils"=>3.0, "Bread"=>0.5}
[6] pry(main)> uncle_alis.add_item("Chicken Tagine", 2)
=> "2 x Chicken Tagine = £10.00"
[7] pry(main)> uncle_alis.add_item("Lentils", 2)
=> "2 x Chicken Tagine = £10.00, 2 x Lentils = £6.00"
[8] pry(main)> uncle_alis.add_item("Bread", 6)
=> "2 x Chicken Tagine = £10.00, 2 x Lentils = £6.00, 6 x Bread = £3.00"
[9] pry(main)> uncle_alis.order_summary
=> "2 x Chicken Tagine = £10.00, 2 x Lentils = £6.00, 6 x Bread = £3.00"
[10] pry(main)> uncle_alis.add_item("Pizza")
RuntimeError: No such item on the menu
from /Users/seanhawkridge/Dropbox/Dev/takeaway-challenge/lib/restaurant.rb:22:in `add_item'
[11] pry(main)> uncle_alis.order_total
=> "Order Total: £19.00"
[12] pry(main)> uncle_alis.place_order(18.00)
RuntimeError: Wrong payment amount
from /Users/seanhawkridge/Dropbox/Dev/takeaway-challenge/lib/restaurant.rb:42:in `place_order'
[13] pry(main)> uncle_alis.place_order(19.00)
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC419b01a364d7474cd3f99212ea942b70/Messages/SM29c9ac2bb3c246a1bc5dfaf7d4d1aa14>
[14] pry(main)>


`````
