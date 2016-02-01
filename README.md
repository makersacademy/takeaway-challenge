Takeaway Challenge
===================
[![Build Status](https://travis-ci.org/yyl29/takeaway-challenge.svg?branch=master)](https://travis-ci.org/yyl29/takeaway-challenge) [![Coverage Status](https://coveralls.io/repos/github/yyl29/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/yyl29/takeaway-challenge?branch=master)

What is it?
-----------

This is Week 2 weekend challenge at Makers Academy. This Takeaway program can take customer's order from a list of available dishes on a menu. Once the order is placed, a confirmation text will be sent using the Twilio API, notifying customer the delivery time. Full instructions can be found in [INSTRUCTIONS.md](https://github.com/yyl29/takeaway-challenge/blob/master/INSTRUCTIONS.md).

Features
---------

* Menu of a list of available dishes with prices on request
* Multiple dishes can be selected at the same time
* Order is checked before placing
* Text confirmation service notifying the delivery time

User Guide
----------

This programme can be run in `irb` or `pry` from the command line. Replace `PHONE` with a valid phone number for text service.

```
$ irb
2.2.3 :001 > require './lib/takeaway'
 => true
2.2.3 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007fff313a5970 @menu=#<Menu:0x007fff313a5948 @filename="menu.yaml">, @order=#<Order:0x007fff313a5880 @basket={}, @order_total=0>, @messenger=#<Messenger:0x007fff313a5830>>
2.2.3 :003 >
```

To see a list of available dishes on the menu, use the `.read_menu` command. A sample menu is provided in the `./lib/menu.yaml` file, and can be edited using the same format.

```
.2.3 :003 > takeaway.read_menu
 => {:onion_bhaji=>2.95, :chicken_tikka_masala=>7.95, :naan=>1.95}
2.2.3 :004 >
```

Select dishes by entering the dish names with desired quantity, using the `.select_dishes` command. Multiple items can be added at the same time.

```
2.2.3 :004 > takeaway.select_dishes(onion_bhaji: 1)
 => {:onion_bhaji=>1}
2.2.3 :005 > takeaway.select_dishes(chicken_tikka_masala: 2, naan: 3)
 => {:onion_bhaji=>1, :chicken_tikka_masala=>2, :naan=>3}
2.2.3 :006 > takeaway.select_dishes(naan: 1)
 => {:onion_bhaji=>1, :chicken_tikka_masala=>2, :naan=>4}
2.2.3 :007 >
```

To place an order, use the `.checkout` command. Then confirm the order by entering the total number of dishes ordered using the `.confirm_order` command. Replace `PHONE` with a valid phone number for text service.

```
2.2.3 :007 > takeaway.checkout
 => "You've ordered 7 items."
2.2.3 :008 > takeaway.confirm_order(7, PHONE)
 => "Thank you! Your order was placed and will be delivered before 14:48. Total price is £26.65"
2.2.3 :009 >
```

Once the order is placed, a confirmation text would then be sent to the provided phone number, notifying of the delivery time. The delivery time is currently set to 1 hour from ordering.