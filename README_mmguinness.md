Takeaway Challenge
==================
  
* User stories:

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

* Domain Model

===============================================
|            class TakeAway                   |
-----------------------------------------------
|    +menu : Menu{ dish => price }            |
|                                             |
-----------------------------------------------
|    +display_menu ->  Menu{ dish => price }  |  
|    +add_dish_to_menu -> Menu[dish]          |
|    +receive_order(Order) -> Twilio Text     |
|                                             |
===============================================

===============================================
|           class Order                       |
-----------------------------------------------
|    +order : Order[]                         |
|                                             |
-----------------------------------------------
|    +view_menu(Takeaway) -> Menu[]           | 
|    +add_dish(t-away, dish, no.) -> Order[]  |
|    +check_total -> number                   |
|    +verify_order -> boolean                 |
|    +place_order -> Order[] & receive Text   | 
|                                             |
===============================================


* IRB Testing

admin@Maries-MacBook-Pro takeaway-challenge % irb
 => true 
 3.0.2 :002 > require './lib/takeaway'
 => true 
3.0.2 :003 > takeaway = Takeaway.new
 => #<Takeaway:0x00007ff482880a58 @menu={}> 
3.0.2 :005 > takeaway.add_dish_to_menu("Dish 1", 10)
 => 10 
3.0.2 :005 > takeaway.add_dish_to_menu("Dish 2", 12)
 => 12 
3.0.2 :006 > takeaway.add_dish_to_menu("Dish 3", 14)
 => 14 
3.0.2 :008 > takeaway.display_menu
 => {"Dish 1"=>10, "Dish 2"=>12, "Dish 3"=>14} 
3.0.2 :006 > takeaway.receive_order("Dish 1, Dish 2")
"Thank you! Your order was placed and will be delivered before 11:11"
3.0.2 :008 > 

3.0.2 :002 > require './lib/order'
 => true 
3.0.2 :003 > order = Order.new
3.0.2 :011 > order.view_menu(takeaway)
{"Dish 1"=>10, "Dish 2"=>12, "Dish 3"=>14}
 => {"Dish 1"=>10, "Dish 2"=>12, "Dish 3"=>14} 

3.0.2 :007 > order.add_dish(takeaway, "Dish 2", 2)
 => 2 
3.0.2 :008 > order.add_dish(takeaway, "Dish 1", 1)
 => 1 
3.0.2 :009 > order.total
 => 34 
3.0.2 :010 > order
 => #<Order:0x00007f8a1a0a1580 @dishes=["Dish 2", "Dish 2", "Dish 1"], @order_cost=[12, 12, 10]> 

3.0.2 :011 > order.verify_order(takeaway)
"check_arr equals : [12, 12, 10]"
"total equals : 34"
true
 => true 
3.0.2 :012 > order.place_order(takeaway)
 => [] 
3.0.2 :013 > order
 => #<Order:0x00007f8a1a0a1580 @dishes=[], @order_cost=[]> 
3.0.2 :014 > 




Reference for double/ mocking = 
https://stackoverflow.com/questions/28519261/rspec-stub-to-allow-hash-key-to-be-passed


* RSpec Tests
1.  TakeAway 
    #display_menu
     'should start with no dishes on a menu'
     'should display dishes on a menu with prices'

    #add_dish_to_menu 
      'should add one dish to the menu'

    #recieve_order
      'should recieve an order with 1 argument' 
      'should send a text when passed an order'

2. Order Tests
    #view_menu
      'should display the menu from the takeaway'

    #add_dish
      'should accept a takeaway, dish and quantity'

    #check total
      'should check the total cost of the order'

    #verify_order
      'should check the cost of items added to order 
      and compare this to the order total'

    #place_order
      'should pass the order to the takeaway'
      'should clear the order contents'
