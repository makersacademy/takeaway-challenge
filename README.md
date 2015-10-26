Takeaway Challenge
==================

This program allows the user to view the original McDonalds menu, select any number of available items from the menu, check a summary of the order before confirming and receiving a text message upon completion of the order.

Instructions

Open irb and require the following files:

```
require './lib/menu'
require './lib/order'
require './lib/order_summary'

```

A user can then check the menu, order items and view a summary of their basket as follows:

```
[4] pry(main)> menu = Menu.new
=> #<Menu:0x007fb8bb19f9f8
 @dishes=
  {"Pure Beef Hamburger"=>1,
   "Tempting Cheeseburger"=>1.5,
   "Triple-Thick Shakes"=>2,
   "Golden French Fries"=>0.5,
   "Thirst-Quenching Coke"=>0.5,
   "Delightful Root Beer"=>0.5,
   "Steamy Hot Coffee"=>0.5,
   "Full-Flavour Orange Drink"=>0.5,
   "Refreshingly Cold Milk"=>0.75}>
[5] pry(main)> order = Order.new
=> #<Order:0x007fb8bb156190
 @menu=
  #<Menu:0x007fb8bb156168
   @dishes=
    {"Pure Beef Hamburger"=>1,
     "Tempting Cheeseburger"=>1.5,
     "Triple-Thick Shakes"=>2,
     "Golden French Fries"=>0.5,
     "Thirst-Quenching Coke"=>0.5,
     "Delightful Root Beer"=>0.5,
     "Steamy Hot Coffee"=>0.5,
     "Full-Flavour Orange Drink"=>0.5,
     "Refreshingly Cold Milk"=>0.75}>,
 @summary=#<OrderSummary:0x007fb8bb156118 @basket={}>>
[6] pry(main)> order.add_item("Pure Beef Hamburger")
=> "1 Pure Beef Hamburger(s) added to your order"
[7] pry(main)> order.add_item("Triple-Thick Shakes", 4)
=> "4 Triple-Thick Shakes(s) added to your order"
[8] pry(main)> order.summary
=> #<OrderSummary:0x007fb8bb156118 @basket={"Pure Beef Hamburger"=>1, "Triple-Thick Shakes"=>4}>
[9] pry(main)> order.total_price
=> 9

```

If a user tries to select a menu that is not on the menu they will receive an error message:

```
[11] pry(main)> order.add_item("Chicken & chips")
RuntimeError: Sorry we don't have Chicken & chips on the menu

```

To finalise an order a user must confirm the order and the total price as follows:
