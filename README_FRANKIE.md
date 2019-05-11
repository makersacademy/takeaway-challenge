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

User stories

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


My Approach to building the challenge: 
- Listing the potential classes - customer, menu - and their messages
- Drawing a functional representation of how the classes communicate with each other
- Installing bundle and setting up the RSpec environment


IRB TESTING
Display menu


Francescas-MacBook-Pro:takeaway-challenge francescachater$ irb
2.5.0 :001 > require './lib/menu.rb'
 => true 
2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007fadcb0b2a18 @items={}, @dish=nil, @price=nil> 
2.5.0 :003 > menu.display
 => {:dish=>nil, :price=>nil} 
2.5.0 :004 > exit
Francescas-MacBook-Pro:takeaway-challenge francescachater$ irb
2.5.0 :001 > require './lib/menu.rb'
 => true 
2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007fdd66946ba0 @items={}, @dish="carrot cake", @price=2> 
2.5.0 :003 > menu.display
 => {:dish=>"carrot cake", :price=>2} 
2.5.0 :004 > 




