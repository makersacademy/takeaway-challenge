[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg?branch=mohamedIssaq)](https://coveralls.io/github/makersacademy/takeaway-challenge?branch=rorymcgit)  [![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

Takeaway Challenge 
==================
```
                            _________
              r==           |       |
           _  //            |F O O D|   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------/     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'
 
 ```

This challenge was to design a system (using TDD in RSpec and an object oriented design in Ruby) where a user could order various dishes from a restaurant menu and receive a text confirming the order. I wrote it over the weekend of my second week at Makers Academy.

In irb:
```
:001 > require './lib/takeaway'
:002 > takeaway = Takeaway.new
 => #<Takeaway:0x007fd390885390 @menu=#<Menu:0x007fd390885318 @the_menu={"Charsui pork"=>5, "Choisum"=>3, "Drink"=>1}>, @order=#<Order:0x007fd3908852a0 @current_order={}>, @text=#<Text:0x007fd390885228 @client=<Twilio::REST::Client @account_sid=ACd1e035e18219b4a2e47ed7c7e7e69deb>>, @total=0>
:003 > takeaway.show_menu
1: Charsui pork -- £5
2: Choisum -- £3
3: Drink -- £1
 => {"Charsui pork"=>5, "Choisum"=>3, "Drink"=>1}
:004 > takeaway.choose_dish("Choisum", 2)
:005 > takeaway.choose_dish("Charsui pork", 2)
:006 > takeaway.choose_dish("Drink", 3)
:007 > takeaway.order
 => #<Order:0x007fd3908852a0 @current_order={"Choisum"=>2, "Charsui pork"=>2, "Drink"=>3}>
:008 > takeaway.calculate_total
:009 > takeaway.place_order(19)
Confirmation text message has been sent.
``` 

The encapsulation of classes is as follows:  
-- Menu is responsible for printing the menu it holds.  
-- Order is responsible for storing the current order.  
-- Takeaway is responsible for the user's interaction and calculation of the total cost.  
-- Text is responsible for sending the confirmation text message.  


Currently the user calls takeaway.calculate_total method, but if this is not explicitly called it will be called when the order is placed and the user passes in the expected total cost. The user can check the total at any time after this method is called by calling takeaway.total.  
If I were to revisit this I would maybe have added a calculator class, as this feels like a separate object to the takeaway ordering interface.


Technologies used:
- Ruby
- RSpec
- Twilio (an SMS ruby gem)
