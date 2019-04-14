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

Makers Project
-------
This is a project from week 2 of Makers academy. The project entails a simple Takeaway program which allows the user to do the following:

    - View a menu
    - Add items to a new takeaway order
    - Review their order with accurate costs
    - Confirm their order
    - Receive a confirmation of delivery & estimated time text
    
 I have completed all but the last of these steps, where the process works except for a failure in the Twilio phone number. 
 I intend to fix this over the coming week. 
 
Using the Program
-------
irb
2.5.0 :001 > require './lib/takeaway'
 => true 
2.5.0 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x00007fd8a6254b40 @menu=#<Menu:0x00007fd8a6254b18>, @order=#<Order:0x00007fd8a6254af0 @basket={}, @order_total=0, @menu=#<Menu:0x00007fd8a6254aa0>>, @message=#<Message:0x00007fd8a6254a78>> 
2.5.0 :003 > takeaway.print_menu
 => {"Chicken bits"=>5, "Burger"=>5, "Pizza"=>8, "Chips"=>3} 
2.5.0 :004 > takeaway.add_item("Burger", 2)
 => 2 
2.5.0 :005 > takeaway.add_item("Pizza", 1)
 => 1 
2.5.0 :006 > takeaway.add_item("Chips", 2)
 => 2 
2.5.0 :007 > takeaway.view_order
2x Burger: £10
1x Pizza: £8
2x Chips: £6
 => 24 
2.5.0 :008 > takeaway.confirm_order

