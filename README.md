Takeaway Challenge
==================

Edward Kerry
github.com/edwardkerry

Submission for Makers Academy Weekend Challenge 2

Overview
-------

This program simulates a takeaway restaurant.
The restaurant owner can set a menu of dishes with prices.
Customers may view the menu, and choose any quantity of each dish.
At any time, customers may view their current order details, including price of
each item type ordered, and confirm their order to see their final bill.
Further orders may still be placed, until the order is completed.
A confirmation text message informs customers of their delivery time.

Instructions
-------

```
require './lib/takeaway'
require './lib/menu'
require './lib/text'
require './lib/order'

menu = Menu.new
menu.create('fish', 4.99)
menu.create('chips', 2.49)

takeaway = Takeaway.new(menu, Order, Text.new)
takeaway.check_menu
  => {"fish"=>4.99, "chips"=>2.49}
takeaway.place_order('fish', 2)
  => fish x 2: total £9.98
takeaway.place_order('chips', 2)
  => fish x 2: total £9.98
  => chips x 2: total £4.98
takeaway.confirm_order
  => fish x 2: total £9.98
  => chips x 2: total £4.98
  => Final bill: £14.96
takeaway.place_order('chips', 1)
  => fish x 3: total £14.97
  => chips x 2: total £4.98
takeaway.complete_order
  => Enter phone number for confirmation text
  #upon entering a verified phone number, a confimation text message is sent.
```

* Four classes move towards ensuring the Single Responsibility Principle.
  * Menu handles the creation and storing of dishes and prices.
  * Text handles the sending of the confirmation text message.
  * Order handles the currently ordered dishes.
  * Takeaway handles communication between the classes. It currently has several
  methods related to calculating bills which better belong in Order.
 
