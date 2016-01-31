# Takeaway Challenge 
==================
[![Coverage Status](https://coveralls.io/repos/github/MarcoCode/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/MarcoCode/takeaway-challenge?branch=master) [![Build Status](https://travis-ci.org/MarcoCode/takeaway-challenge.svg?branch=master)](https://travis-ci.org/MarcoCode/takeaway-challenge)
------------------

What is it?
-----------

* My Work on the Makers's Academy TakeAway challenge, using Twilio API to communicate with the user

Rationale
---------

* The Takeaway class
           - Is responsible for the interface of the program 
		   
* The Restaurant class
           - Is responsible to store a specific menu type 

* The Order class 
           - Is responsible for managing the order

Instructions
------------

irb(main):002:0> t = Takeaway.new

=> \#\<Takeaway:0x007fc73983e1b0 @action=nil, @restaurant=#<Restaurant:0x007fc73983e188 @cuisine="Italian", @menu={"Pizza"=>10.0, "Pasta"=>8.0, "Milanese"=>14.0}>, @order_log=#<Order:0x007fc73983e110 @status=[], @total=0>\>

irb(main):003:0> t.menu

What cousine would you like?
1 - Italian
2 - Mexican
3 - Indian

1

Pizza = £10.0
Pasta = £8.0
Milanese = £14.0

=> "Please order from the menu above:"

irb(main):006:0> t.order("milanese", 7)

=> "7 x milanese added to your order."

irb(main):007:0> t.check_order

Milanese x 7 = £98.0

=> "Total = £98.0"

irb(main):008:0> t.clear_order

=> "Your basket is now empty."

irb(main):009:0> t.order "pizza", 6

=> "6 x pizza added to your order."

irb(main):010:0> t.order "pasta"

=> "1 x pasta added to your order."

irb(main):011:0> t.check_order

Pizza x 6 = £60.0
Pasta x 1 = £8.0

=> "Total = £68.0"









-------








