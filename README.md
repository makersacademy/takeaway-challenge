Takeaway Challenge
==================
 Our task is to build a program that users can use to order a takeaway, and in return get a confirmation text with details of their order.

Approach
--------
My program has 3 classes: take_away, order and menu. The take_away is the public interface and handles user input. 
  This input is then passed off to the order class which is in charge of adding dishes to the order and pricing everything.
  The dishes and prices are stored within the menu class.
  
Instructions
------------
```
  2.2.3 :002 > chinese = TakeAway.new
   => #<TakeAway:0x007ffefb0771f8 @order=#<Order:0x007ffefb0771d0 @basket={}, @current_order="", @total_amount=0, @menu={"Salted Chilli Ribs"=>5.1, "Spring Roll"=>1.5, "Prawn Toast"=>2.5, "Scallops With Ginger & Spring Onion"=>5.6, "Chicken in Blackbean"=>4.8, "Egg Fried Rice"=>1.9}>, @env={"account_sid"=>"account_sid", "auth_token"=>"auth_token", "from_number"=>"from", "to_number"=>"to"}> 
  2.2.3 :003 > chinese.order "Egg Fried Rice", 4
   => 7.6 
  2.2.3 :004 > chinese.order "Spring Roll"
   => 9.1 
  2.2.3 :005 > chinese.basket_summary
   => "Egg Fried Rice x4: £7.60\nSpring Roll x1: £1.50\n" 
  2.2.3 :006 > chinese.total
   => "Total: £9.10" 
  2.2.3 :007 > chinese.complete_order(9.10)
```
Build Status
-----------

[![Build Status](https://travis-ci.org/tcpickard94/takeaway-challenge.svg?branch=master)](https://travis-ci.org/tcpickard94/takeaway-challenge)
