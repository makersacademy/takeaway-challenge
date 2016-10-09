# Takeaway Challenge #

Takeaway ordering system that allows a user to see and order meals.

* **Takeaway (takeaway.rb)** - The main file to interact with the program.

* **Menu (menu.rb)** - Used for storing the menu array and printing its contents.

* **Order System (order_system.rb)** - Manages various ordering operations.

* **MyTwilio (my_twilio.rb)** - Stores details for Twilio integration to send SMS confirmation.

[![Build Status](https://travis-ci.org/JG075/takeaway-challenge.svg?branch=master)](https://travis-ci.org/JG075/takeaway-challenge)

## Setup ##

To run the program:

```
irb #from the takeaway-challenge folder
require_relative "./lib/takeaway.rb"
takeaway = Takeaway.new
```

You can then use the following methods:

* show_menu
* order(item, quantity)
* show_order
* show_total
* confirm(amount)

## Example ##

```
2.3.1 :002 > takeaway = Takeaway.new
 => #<Takeaway:0x007f945a220588...
2.3.1 :003 > takeaway.show_menu
1. Chicken Curry £4.99
2. Pizza £3.99
3. Chips £1.99
 => {:"Chicken Curry"=>4.99, :Pizza=>3.99, :Chips=>1.99}
2.3.1 :004 > takeaway.order("Chips", 5)
 => [5, 9.95]
2.3.1 :005 > takeaway.order("Chicken Curry", 4)
 => [4, 19.96]
2.3.1 :006 > takeaway.show_order
5 x Chips £9.95
4 x Chicken Curry £19.96
 => {:Chips=>[5, 9.95], :"Chicken Curry"=>[4, 19.96]}
2.3.1 :007 > takeaway.show_total
Total: £29.91
 => nil
2.3.1 :008 > takeaway.confirm(29.91)
```
