Takeaway Challenge
==================
Come eat with me. No, not English food. Please.
-----------------
[![Build Status](https://travis-ci.org/letianw91/takeaway-challenge.svg?branch=master)](https://travis-ci.org/letianw91/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/letianw91/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/letianw91/takeaway-challenge?branch=master)

##Running example
```
2.2.3 :008 > lw = Customer.new("Letian Wang", "+61430990824")
 => #<Customer:0x00000000f46eb0 @name="Letian Wang", @number="+61430990824", @current_order=nil, @order_history=[], @messenger=#<TwilioMessenger:0x00000000f46dc0 @client=<Twilio::REST::Client @account_sid=AC28b49fe674fe72904e325b4618b00b0d>>> 
2.2.3 :009 > lw.begin_order(TakeAway.new(menu))
 => #<TakeAway:0x00000000dca488 @menu=#<Menu:0x000000011b6628 @dishes=[#<Dish:0x000000011d14c8 @name="curry_beef", @price=13>, #<Dish:0x000000011dc698 @name="curry_chicken", @price=12>]>, @cart={}> 
2.2.3 :010 > lw.current_order.show_menu
curry_beef: $13
curry_chicken: $12
 => [#<Dish:0x000000011d14c8 @name="curry_beef", @price=13>, #<Dish:0x000000011dc698 @name="curry_chicken", @price=12>] 
2.2.3 :011 > lw.current_order.add_item('curry_chicken',3)
 => 3 
2.2.3 :012 > lw.current_order.add_item('curry_beef',3)
 => 3 
2.2.3 :013 > lw.current_order.add_item('roasted_snake',3)
RuntimeError: dish does not exit!
    from /home/letianw/Projects/weekend _challenges/takeaway-challenge/lib/takeaway.rb:17:in `add_item'
    from (irb):13
    from /home/letianw/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'
2.2.3 :014 > lw.current_order.cart_summary
3 X curry_chicken = $36
3 X curry_beef = $39
total: $75
 => nil 
2.2.3 :015 > lw.place_order(75)
 => nil 
#my phone receives a message at this point
```

##Classes
* Customer: responsible for starting order, placing order, and keep order history

* TwilioMessenger: responsible for sending the sms to customer

* TakeAway(order): responsible for adding dishes to the cart, showing a summary of the cart, and calculating total price of cart

* Menu: responsible for printing the menu, provide the price of a dish, and check if a dish is in the menu

* Dish: responsible for storing the name and price of a dish

##Structure of classes

![structure](https://github.com/letianw91/takeaway-challenge/blob/master/structure.png)

##Problems

1. TwilioMessenger class is not properly tested.
2. TakeAway class is way too coupled with the menu. It relies on the menu to print itself, to get price of individual dishes and to check if a dish name given by customer is legit or not. 