# Takeaway Challenge 
==================
[![Coverage Status](https://coveralls.io/repos/github/MarcoCode/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/MarcoCode/takeaway-challenge?branch=master) [![Build Status](https://travis-ci.org/MarcoCode/takeaway-challenge.svg?branch=master)](https://travis-ci.org/MarcoCode/takeaway-challenge)
------------------

What is it?
-----------

* My Work on the Makers's Academy TakeAway challenge, using Twilio API to communicate with the user


Instructions
------------

irb(main):002:0> takeaway = Takeaway.new

=> \#\<Takeaway:0x007fe483919dc0 @action=nil, @restaurant=#<Restaurant:0x007fe483919d48 @cuisine="", @menu={"Pizza"=>10.0, "Pasta"=>8.0, "Milanese"=>14.0}>, @order_log=#<Order:0x007fe483919c80 @status=[], @total=0>\>

irb(main):003:0> takeaway.menu

What cousine would you like?
1 - Italian
2 - Mexican
3 - Indian

1

Pizza = £10.0
Pasta = £8.0
Milanese = £14.0

=> {"Pizza"=>10.0, "Pasta"=>8.0, "Milanese"=>14.0}

irb(main):006:0> takeaway.order("pizza", 3)

=> 3






-------








