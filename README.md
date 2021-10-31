Takeaway Challenge
==================


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

__COVERAGE:  97.06% -- 66/68 lines in 6 files__

To run in IRB:
--------------
```ruby
3.0.2 :001 > require './lib/order.rb'
 => true 
3.0.2 :002 > order = Order.new
 => 
... 
3.0.2 :003 > menu = Menu.new
 => #<Menu:0x0000000125876830 @list=[], @menu_items={"Egg fried rice"=>2, "Special fried rice"=>2, "Prawn toast"=>2, "Chicken balls"=>2.5, "Spring rolls"=>2.5, "Char siu pork"=>3, "Beef chow mein"=>3.5, "Spare ribs"=>3.5}> 
3.0.2 :004 > menu.show_menu
 => "Egg fried rice : £2\nSpecial fried rice : £2\nPrawn toast : £2\nChicken balls : £2.5\nSpring rolls : £2.5\nChar siu pork : £3\nBeef chow mein : £3.5\nSpare ribs : £3.5" 
3.0.2 :005 > order.add_item("Egg fried rice", 2)
 => ["2x Egg fried rice ordered (£4)"] 
3.0.2 :006 > order.add_item("Char siu pork")
 => ["2x Egg fried rice ordered (£4)", "1x Char siu pork ordered (£3)"] 
3.0.2 :007 > order.add_item("Beef chow mein")
 => ["2x Egg fried rice ordered (£4)", "1x Char siu pork ordered (£3)", "1x Beef chow mein ordered (£3.5)"] 
3.0.2 :008 > order.place_order
Thanks! Your order was placed and will be delivered before 17:58
 => nil 
```
