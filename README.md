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

This program is designed to display a list of dishes with prices, enable the user to select a number of available dishes and check that the provided total price matches the sum of the dishes selected. Finally the program should send the user a confirmation text when they have completed their order.

Please see example of user journey in irb below:

3.0.2 :001 > require './lib/takeaway.rb'
 => true 
3.0.2 :002 > myorder = Takeaway.new
 => #<Takeaway:0x0000000126817028 @basket={}, @menu=#<Menu:0x0000000126816f88 @items={"Pepperoni Pizza"=>10, "Coke"=>1}>> 
3.0.2 :003 > myorder.order("Pepperoni Pizza", 3)
 => "3x Pepperoni Pizza added to your order." 
3.0.2 :004 > myorder.order("Coke", 2)
 => "2x Coke added to your order." 
3.0.2 :005 > myorder.basket_summary
 => "Pepperoni Pizza x3 = £30, Coke x2 = £2" 
3.0.2 :006 > myorder.total
 => 32 


Unfortuantely I was not able to complete user story 4 of this challenge, which requires the program
to send an SMS (via the Twilio service) to the user telling them the time their order will arrive by
(1 hour after order time).

To complete this challenge the next thing I would do is calculate the current time of order using Time.now, and add 1 hour to it, then output this as a string, as a basis for the text sent to user.

