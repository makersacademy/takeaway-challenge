# README

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)

## Install Instructions

To install these files from Github:
1. Fork this repo, and clone to your local machine.
2. Run the command gem install bundle (if you don't have bundle already) from the cloned file location.
3. When the installation completes, run bundle.
4. Sign up for a free account at www.twilio.com.
5. In toms_takeaway.rb you will need to update the ENV variables with your account information.
6. Run IRB -r './toms_takeaway.rb'
7. Rspec tests can be found at Rspec spec

## Approach to Solution

This blog post explores this further: (https://tomstuart92.github.io/TomsTakeaway/)

The interface class is only responsible for accepting input from users and delegating to other classes.
The menu class is responsible for displaying understanding which items are on the menu.
The order class is responsible for aggregating items for the user to purchase.
The adapter class is responsible for the interaction of the core code with the Twilio API. It is the only untested class.

I have focused on ensuring minimal dependencies between my classes.
This was done using dependency injection, and limiting the number of public methods.

## Usage Instructions
From toms_takeaway.rb:
- Your takeaway can be accessed on the variable - TomsTakeaway.
- Use .show_menu to view menu.
- Use .new_order to start a new order.
- Use .order(item, quantity) to add item to order.
- Use .review_order to view a summary of the order.
- Use .checkout to checkout order.

In IRB:

```
tomstuamacbook2:takeaway-challenge Tom$ irb -r './toms_takeaway.rb'
Welcome to Tom's Takeaway!
Your takeaway can be accessed on the variable - TomsTakeaway
Use .show_menu to view menu.
Use .new_order to start a new order.
Use .order with the item name to add item to order.
Use .review_order to view a summary of the order.
Use .checkout to checkout.
------------------------------------------------------------
2.3.1 :001 > TomsTakeaway.show_menu
Here is the menu:
{"spring roll"=>0.99, "peking duck"=>7.99}
 => nil
2.3.1 :002 > TomsTakeaway.new_order
 => #<Order:0x007f89b8a69638 @basket={}, @menu=#<Menu:0x007f89b8abb5f0 @menu={"spring roll"=>0.99, "peking duck"=>7.99}>, @total=0>
2.3.1 :003 > TomsTakeaway.order('spring roll')
 => 1
2.3.1 :004 > TomsTakeaway.order('spring roll')
 => 2
2.3.1 :005 > TomsTakeaway.order('spring roll')
 => 3
2.3.1 :006 > TomsTakeaway.order('peking duck', 3)
 => 3
2.3.1 :007 > TomsTakeaway.review_order
Spring roll x 3 : $2.97
Peking duck x 3 : $23.97
Total = $26.94
 => nil
2.3.1 :008 > TomsTakeaway.checkout(26.94)
Thank you for your order.
```

### Author Details
Created by Tom Stuart
www.github.com/tomstuart92
