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

 * First commit - This is later than intended and follows the additional step
  * Set up file with takeaway, takeaway_spec, menu, menu_spec.
  * have written and passed 2 tests in takeaway_spec
  * have written and passed 1 test in menu_spec
  * all functionality was checked in IRB in the first instance

  - User story 1 completed - when takeaway.menu is called the menu list is given.

  * decided that user story demanded different functionality, went back and changed
  * takeaway now initializes with a menu pulled from Menu class

  - Working on user story 2

  * commited after passing green for "order with any args".
  * commited after initializing @cust_order as empty array"

  - Working on user story 3

  * commited after storing and returning customer order
  -
  * Order class is storing customer order
  -
  * Order class properly integrated

  -
  * Outputs summary of users choices
  * Outputs summary of cost

  -
  * Some refactoring and adjusting to get sum of cost.

  -
  * Got the list of food and cost returning

  -
  * installed Twilio and started following instructions, but didn't have the time to see
  * through as it was clearly a big part of the undertaking.
IRB spark
require './lib/takeaway.rb'
ta = TakeAway.new
ta.seemenu
ta.orders("soup")
ta.orders("soup")

2.6.5 :001 > require './lib/takeaway.rb'
 => true
2.6.5 :002 > ta = TakeAway.new
 => #<TakeAway:0x00007fc79207ec28 @menu=#<Menu:0x00007fc79207ec00>, @order=#<Order:0x00007fc79207ebd8 @food_array=[], @tot_cost=0, @menu=#<Menu:0x00007fc79207eb88>>>

2.6.5 :003 > ta.seemenu
 => {"dimsum"=>3, "soup"=>4, "rice"=>7}
2.6.5 :004 > ta.orders("soup")
 => {"dimsum"=>3, "soup"=>4, "rice"=>7}
2.6.5 :005 > ta.orders("soup")
 => {"dimsum"=>3, "soup"=>4, "rice"=>7}
2.6.5 :006 > ta.see_order
you've ordered soup x 2, your meal will cost £8
