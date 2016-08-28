#Takeaway Challenge#

This is the takeaway challenge, an app that allows the user to display a menu, order items, check the order total and receive a text confirmation of the order sent via Twilio.

The app works, with a small bug on sending that does not affect the delivery of the text or food.

The following commands can be run:

```
2.3.1 :002 > t = Takeaway.new
 => #<Takeaway:0x007f9e890fcad8 @text=#<Text:0x007f9e890fca60>, @order=#<Order:0x007f9e890fcab0 @basket={}, @total=0>>

2.3.1 :003 > t.read_menu
 => {"chips"=>1.0, "cheeseburger"=>5.0, "chicken burger"=>6.0, "coke"=>0.7}

2.3.1 :004 > t.add("cheeseburger",2)
 => "Added 2x cheeseburger to your order."

2.3.1 :005 > t.add("chips",2)
 => "Added 2x chips to your order."

2.3.1 :006 > t.view_order
 => "Your basket contains: {\"cheeseburger\"=>2, \"chips\"=>2}"

2.3.1 :007 > t.check_total
 => "The correct total is £12.00."

2.3.1 :008 > t.confirm_order(12)
```
