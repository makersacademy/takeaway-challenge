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
User Stories
------------------

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

This is a partially completed challenge - I ran out of time to complete the final User Story and so wasn't able to add the text message functionality.

I've had issues testing for the error messages and finding the best solution for totalling the bill.

This is the program in IRB curently:

```
:001 > require './lib/takeaway.rb'
 => true
:002 > t = Takeaway.new
 => #<Takeaway:0x00007f8c8e8ba688 @menu=#<Menu:0x00007f8c8e8ba610 @dishes={"1 piece chicken meal"=>4.49, "2 piece chicken meal"=>5.49, "chicken nuggets meal"=>4.49, "popcorn chicken meal"=>5.79, "spicy wings meal"=>5.49, "mega bucket meal"=>24.99}>, @order=#<Order:0x00007f8c8e8ba188 @basket={}, @menu={"1 piece chicken meal"=>4.49, "2 piece chicken meal"=>5.49, "chicken nuggets meal"=>4.49, "popcorn chicken meal"=>5.79, "spicy wings meal"=>5.49, "mega bucket meal"=>24.99}>>
:003 > t.order('chicken nuggets meal', 2)
 => nil
:004 > t.order('mega bucket meal')
 => nil
:005 > t.view_basket
 => {"chicken nuggets meal"=>8.98, "mega bucket meal"=>24.99}
:006 > t.total_bill
 => 33.97
```
I enjoyed the challenge and know exactly what I need to work on next.
