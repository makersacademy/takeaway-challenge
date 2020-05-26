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

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

**Planning**

https://trello.com/b/qCYjX4bM/10-saturday-23-5-20

  **User story 1**

  * First commit - This is later than intended and follows the additional step
  * Set up file with takeaway, takeaway_spec, menu, menu_spec.
  * have written and passed 2 tests in takeaway_spec
  * have written and passed 1 test in menu_spec
  * all functionality was checked in IRB in the first instance

  **User story 1 completed**

  * decided that user story demanded different functionality, went back and changed

  * takeaway now initializes with a menu pulled from Menu class

  **Working on user story 2**

  * commited after passing green for "order with any args".

  * commited after initializing @cust_order as empty array"

  **Working on user story 3**

  * commited after storing and returning customer order

  * Order class is storing customer order

  * Order class properly integrated

  * Outputs summary of users choices

  * Outputs summary of cost

  * Some refactoring and adjusting to get sum of cost.

  * Got the list of food and cost returning

  * installed Twilio and started following instructions, but didn't have the time to see\
  * through as it was clearly a big part of the undertaking.
IRB spark\
require './lib/takeaway.rb'\
ta = TakeAway.new\
ta.seemenu\
ta.orders("soup")\
ta.orders("soup")

2.6.5 :001 > require './lib/takeaway.rb'\
 => true\
2.6.5 :002 > ta = TakeAway.new\
 => #<TakeAway:0x00007fc79207ec28 @menu=#<Menu:0x00007fc79207ec00>, @order=#<Order:0x00007fc79207ebd8 @food_array=[], @tot_cost=0,\ @menu=#<Menu:0x00007fc79207eb88>>>

2.6.5 :003 > ta.seemenu\
 => {"dimsum"=>3, "soup"=>4, "rice"=>7}\
2.6.5 :004 > ta.orders("soup")\
 => {"dimsum"=>3, "soup"=>4, "rice"=>7}\
2.6.5 :005 > ta.orders("soup")\
 => {"dimsum"=>3, "soup"=>4, "rice"=>7}\
2.6.5 :006 > ta.see_order\
you've ordered soup x 2, your meal will cost £8
