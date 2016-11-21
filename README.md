Takeaway Challenge

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
This is a simulation that mimics a restaurant takeaway service. Multiple dishes can be ordered. This is the Makers Academy weekend challenge for the second week.

Technologies used
---------

* Ruby
* Git
* Rspec
* Twilio
* VCR
* Webmock

How to run it
---------------

```
[1] pry(main)> require './lib/order'
=> true
[2] pry(main)> order = Order.new
=> #<Order:0x007ff25a38a0c8
 @current_order_price=0,
 @menu=#<Menu:0x007ff25a38a078 @list_of_dishes={"margherita"=>9, "pepperoni"=>10, "americano"=>11}>,
 @message=#<Message:0x007ff25a38a028>>
[3] pry(main)> order.order("pepperoni", 1)
=> "You have ordered 1 pepperoni(s)."
[4] pry(main)> order.expected_total(10)
=> "Thank you for your order. A text message confirming the order is on its way."
[5] pry(main)>

```
==================

Features
---------
* Menu of multiple items
* Order by quantity
* Method for calculating bill
* Text message confirmation

Approach to solving
---------
1. Started by adding list_of_dishes method that showed a hash of the dishes available.
2. Added order method with two arguments, one for dish the other for quantity
3. Added current order price variable that starts at zero to initialize
4. Refactored code by adding a private bill method to calculate total
5. Dealt with edge cases for orders of less than 1 item and menu items that do not match
6. Added Menu class that contains list of dishes
7. Created Message class that sends text message confirmation


Further work to do
---------

There are considerable problems with some of the doubles that need to be fixed in the order_spec
I
