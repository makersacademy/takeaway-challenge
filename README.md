### Takeaway Challenge ###
A program which allows the user to view a menu and place an order. The user will receive a text message (if operating in IRB) confirming their order.

## How to use ##
To run the program in IRB:
```
$ irb
2.5.0 :001 > require './lib/takeaway'
2.5.0 :002 > require './lib/basket'
2.5.0 :003 > takeaway = Takeaway.new
2.5.0 :004 > takeaway.menu
2.5.0 :005 > takeaway.order("Boiled Rice")
2.5.0 :006 > takeaway.review_order
```

To run rspec from the command line:
``` shell
rspec
```
## Approach ##



## Issues outstanding: ##
- In the takeaway spec file the two unit tests for :order and :review_order are dependant on the Basket class. These tests need to be rewritten to use stubs.
