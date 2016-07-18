Takeaway Challenge
==================

Instructions

* Run the command 'bundle' in the project directory to ensure you have all the gems

* Create a new takeaway object, then add items from the menu

* Once the order is confirmed a text message is sent to the user with a delivery time

* Some example usage

```
2.3.1 :002 > order = Takeaway.new
 => #<Takeaway:0x007f85a1055310 @menu=#<Menu:0x007f85a10552e8 @menu={"lamb donner"=>"4.00", "chicken donner"=>"4.60", "chicken shish"=>"5.00", "mix kebab"=>"5.00", "house special"=>"5.00", "quarter pounder"=>"2.00", "chicken burger"=>"2.00", "regular chips"=>"1.00", "large chips"=>"1.20", "coke"=>"0.60", "7up"=>"0.60", "dr. pepper"=>"0.60", "fanta"=>"0.60"}>, @selection={}>
2.3.1 :003 > order.select_item('large chips', 2)
 => 2
2.3.1 :004 > order.selection
 => {"large chips"=>2}
2.3.1 :005 > order.calculate_total
 => 2.4
2.3.1 :006 > order.confirm_order(2.4)
 => "Order confirmed"
 ```



[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/builds/7045763/badge.svg)](https://coveralls.io/builds/7045763)
