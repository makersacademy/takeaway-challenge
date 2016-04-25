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

my interpretation for the solution
---------------------------------
I tackled the problem by creating 4 classes.
Menu class - handles the menu and methods associated constructing a menu hash
Order class which injects the menu class. It allows users to create an order only of items in the menu. The user can get a basket summary. Once the user has finished creating the order they call checkout with the total for their order.
Finally there is a restaurants class. It injects Order and Messenger instances. If the order passes the checkout and the variable is set to true. The restaurants can call delivery which sends a text message confirming the order and removes the order from the array.


Notes for next release
---------------------
I would like to have included the messenger as a module
The rspec tests need to use more doubles

example run
----------
[1] pry(main)> require './lib/restaurant.rb'
=> true
[2] pry(main)> nandos=Restaurant.new
=> #<Restaurant:0x007fa7b9b083e0
 @messenger=#<Messenger:0x007fa7b9b08368>,
 @order=
  #<Order:0x007fa7b9b08340
   @checkout=false,
   @menu=#<Menu:0x007fa7b9b082a0 @menu={"diet coke"=>0.99, "foie gras"=>18.5, "caviar"=>99.0, "oyster"=>0.99, "champagne"=>50.0}>,
   @order=[]>,
 @order_accepted=[]>
[3] pry(main)> harry=Order.new
=> #<Order:0x007fa7b9a120d0
 @checkout=false,
 @menu=#<Menu:0x007fa7b9a120a8 @menu={"diet coke"=>0.99, "foie gras"=>18.5, "caviar"=>99.0, "oyster"=>0.99, "champagne"=>50.0}>,
 @order=[]>
[4] pry(main)> john=Order.new
=> #<Order:0x007fa7ba8687d8
 @checkout=false,
 @menu=#<Menu:0x007fa7ba868788 @menu={"diet coke"=>0.99, "foie gras"=>18.5, "caviar"=>99.0, "oyster"=>0.99, "champagne"=>50.0}>,
 @order=[]>
[5] pry(main)> john.add_item_qty("diet coke", 8)
=> "8x diet coke added to your basket."
[6] pry(main)> john.add_item_qty("caviar", 8)
=> "8x caviar added to your basket."
[7] pry(main)> john.basket_summary
=> "diet coke x8 = 7.92, caviar x8 = 792.0"
[8] pry(main)> harry.add_item_qty("diet coke", 8)
=> "8x diet coke added to your basket."
[9] pry(main)> harry.add_item_qty("caviar", 8)
=> "8x caviar added to your basket."
[10] pry(main)> harry.add_item_qty("oyster", 8)
=> "8x oyster added to your basket."
[11] pry(main)> harry.basket_summary
=> "diet coke x8 = 7.92, caviar x8 = 792.0, oyster x8 = 7.92"
[12] pry(main)> harry.checkout_order(807.84)
=> true
[13] pry(main)> john.checkout_order(799.92)
=> true
[14] pry(main)>
[15] pry(main)> p nandos.accept_order(harry)
[[["diet coke", 8, 0.99], ["caviar", 8, 99.0], ["oyster", 8, 0.99]]]
=> [[["diet coke", 8, 0.99], ["caviar", 8, 99.0], ["oyster", 8, 0.99]]]
[16] pry(main)> p nandos.order_accepted
[[["diet coke", 8, 0.99], ["caviar", 8, 99.0], ["oyster", 8, 0.99]]]
=> [[["diet coke", 8, 0.99], ["caviar", 8, 99.0], ["oyster", 8, 0.99]]]
[17] pry(main)> p nandos.accept_order(john)
[[["diet coke", 8, 0.99], ["caviar", 8, 99.0], ["oyster", 8, 0.99]], [["diet coke", 8, 0.99], ["caviar", 8, 99.0]]]
=> [[["diet coke", 8, 0.99], ["caviar", 8, 99.0], ["oyster", 8, 0.99]], [["diet coke", 8, 0.99], ["caviar", 8, 99.0]]]
[18] pry(main)> p nandos.deliver
[DEPRECATED] SMS Resource is deprecated. Please use Messages (https://www.twilio.com/docs/api/rest/message)
<Twilio::REST::SMS::Message @path=/2010-04-01/Accounts/AC6e9aa41dc9b52269f000cfedba11868d/SMS/Messages/SM81d85b8229674b4d840011caf75f8175>
=> <Twilio::REST::SMS::Message @path=/2010-04-01/Accounts/AC6e9aa41dc9b52269f000cfedba11868d/SMS/Messages/SM81d85b8229674b4d840011caf75f8175>
[19] pry(main)>
[20] pry(main)> p nandos.deliver
[DEPRECATED] SMS Resource is deprecated. Please use Messages (https://www.twilio.com/docs/api/rest/message)
<Twilio::REST::SMS::Message @path=/2010-04-01/Accounts/AC6e9aa41dc9b52269f000cfedba11868d/SMS/Messages/SM1366e6ad412d498598ef46c2ec95b622>
=> <Twilio::REST::SMS::Message @path=/2010-04-01/Accounts/AC6e9aa41dc9b52269f000cfedba11868d/SMS/Messages/SM1366e6ad412d498598ef46c2ec95b622>
[21] pry(main)>
[22] pry(main)> p nandos.order_accepted
[]
=> []

author
------
harrywynnwilliams@googlemail.com