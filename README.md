Takeaway Challenge		[![Build Status](https://travis-ci.org/UsmanJ/takeaway-challenge.svg?branch=master)](https://travis-ci.org/UsmanJ/takeaway-challenge)	[![Coverage Status](https://coveralls.io/repos/UsmanJ/takeaway-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/UsmanJ/takeaway-challenge?branch=master)
======================

Steps
-----

1. Fork this repo and clone it to your local machine
2. Run the command 'gem install bundle'
3. After installation, run 'bundle'
4. Use the takeaway system.


Approach towards solving the challenge
--------------------------------------

To begin with, it was important to decide on how many classes the system needed. I decided to use two classes. One for the menu and the other for the orders. I also added an additional module for the text method to keep this separate.

I built the system using test-driven development to ensure that bugs can be eliminated. As you can see the build has 100% coveralls.

The takeaway system if fully functional. If you feel that there are any errors or improvements can be made then please let me know.


Steps of using the takeaway system
---------------------------------
```
irb(main):001:0> require './lib/customer.rb'
=> true
irb(main):002:0> customer = Customer.new
=> #<Customer:0x007fe719975ee8 @menu=#<Menu:0x007fe719975ec0 @menu_list={"4x chicken wings"=>1.59, "chicken burger meal"=>4.49, "fries"=>1.29, "pizza"=>4.99}>, @order={}, @order_total=0, @total_items=0>
irb(main):003:0> customer.display_menu
4x chicken wings - £1.59
chicken burger meal - £4.49
fries - £1.29
pizza - £4.99
=> {"4x chicken wings"=>1.59, "chicken burger meal"=>4.49, "fries"=>1.29, "pizza"=>4.99}
irb(main):004:0> customer.select_dish('chicken burger meal', 2)
=> 8.98
irb(main):005:0> customer.select_dish('pizza', 1)
=> 13.97
irb(main):006:0> customer.order_total_cost
=> "Total    £13.97"
irb(main):007:0> customer.receipt
=> "2x chicken burger meal - £8.98, 1x pizza - £4.99"
```
