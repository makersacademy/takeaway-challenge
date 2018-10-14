### Takeaway Challenge ###
A program which allows the user to view a menu and place an order. The user will receive a text message (if operating in IRB) confirming their order.

## How to use ##
To run the program in IRB:
```
$ irb
2.5.0 :001 > require './lib/takeaway'
  => true
2.5.0 :002 > require './lib/basket'
  => true
2.5.0 :003 > takeaway = Takeaway.new
  => #<Takeaway:0x00007f8f82943ea0 @menu=#<Menu:0x00007f8f82943e78 @list={"Sweet and Sour Pork"=>8, "Satay Chicken"=>6, "Boiled Rice"=>2}>, @current_basket=#<Basket:0x00007f8f82943e28 @basket={}>>
2.5.0 :004 > takeaway.menu
   => "Sweet and Sour Pork, £8\nSatay Chicken, £6\nBoiled Rice, £2"
2.5.0 :005 > takeaway.order("Boiled Rice")
  => "Added boiled rice to your order"
2.5.0 :006 > takeaway.review_order
  => "Boiled Rice, £2\nTotal: £2"
```

To run rspec from the command line:
``` shell
rspec
```
## Approach ##



## Issues outstanding: ##
- In the takeaway spec file the two unit tests for :order and :review_order are dependant on the Basket class. These tests need to be rewritten to use stubs.
