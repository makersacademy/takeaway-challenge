Takeaway Challenge
==================

Introduction
------------

This program allows the user to order food from the takeaway class.
The user can order food from a selection of available dishes.
Once the user has confirmed the total price of the order, they can place the order
and expect to receive a text detailing when the order will be delivered.   

This app currently works, however there is a bug when confirming the order twice.
Instead of returning the correct value, the price is doubled.
This is highlighted below in the example
This does not effect the sending of the delivery text, however it is something
that will be resolved soon.

PRY Example
-----------

```
[1] pry(main)> require './lib/takeaway'
=> true
[2] pry(main)> t = Takeaway.new
=> #<Takeaway:0x007f9ec2ca1648
 @menu=#<Menu:0x007f9ec2ca1620 @dishes={"chicken"=>5, "chips"=>2, "burger"=>5, "fish"=>5, "steak"=>6}>,
 @order=
  #<Order:0x007f9ec2ca15a8
   @menu=#<Menu:0x007f9ec2ca1580 @dishes={"chicken"=>5, "chips"=>2, "burger"=>5, "fish"=>5, "steak"=>6}>,
   @selected_dishes={},
   @text=#<Text:0x007f9ec2ca14b8>,
   @total=0>>
[3] pry(main)> t.show_menu
1) chicken:  5
2) chips:  2
3) burger:  5
4) fish:  5
5) steak:  6
=> {"chicken"=>5, "chips"=>2, "burger"=>5, "fish"=>5, "steak"=>6}
[4] pry(main)> t.add("chicken",2)
1) chicken:  5
2) chips:  2
3) burger:  5
4) fish:  5
5) steak:  6
=> 2
[5] pry(main)> t.add("chips",2)
1) chicken:  5
2) chips:  2
3) burger:  5
4) fish:  5
5) steak:  6
=> 2
[6] pry(main)> t.view_order
=> "Your selected dishes are {\"chicken\"=>2, \"chips\"=>2}"
[7] pry(main)> t.order_price
=> "Your total order price is £14"
[8] pry(main)> t.amount?(14) ----- #known error with #total_price and #amount? methods
=> false
[9] pry(main)> t.confirm_order
NoMethodError: undefined method `confirm_order' for #<Takeaway:0x007f9ec2ca1648>
from (pry):9:in `__pry__'
[10] pry(main)> t.order_confirmation
=> "Thank you, your delivery time will be sent by text shortly"
```
