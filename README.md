##TAKEAWAY CHALLENGE
Mark Hill 31/1/2016

####Build software allowing users to view restaurant menus, place orders, and have orders confirmed by text message.

####Content:
User interacts through 'Takeaway' class,  which contains the following functionalities included through modules: 'Calculate', which calculates the price of the order; 'Menu_Print', which displays the menu; 'Mail', which sends the customer a confirmation text (currently disabled); and MenuList, which enables the user to set the menu of the takeaway. An 'Order' class enables the customer to make an order.

####Example

```
2.2.3 :001 > require './lib/takeaway.rb'
 => true
2.2.3 :002 > shop = Takeaway.new
 => #<Takeaway:0x007ffa3223c588 @menu={:Hamburger=>4.5, :Cheeseburger=>4.6, :Chips=>1.0}, @order_instance=#<Order:0x007ffa3223c560 @return_array=[[], []]>>
2.2.3 :003 > shop.show_menu
Menu:
Hamburger. Price: £4.50
Cheeseburger. Price: £4.60
Chips. Price: £1.00
 => {:Hamburger=>4.5, :Cheeseburger=>4.6, :Chips=>1.0}
2.2.3 :004 > shop.order("Hamburger", 1)
"current order is [[:Hamburger], [1]]"
 => [[:Hamburger], [1], [4.5]]
2.2.3 :005 > shop.order("Hamburger", 1)
"current order is [[:Hamburger, :Hamburger], [1, 1]]"
 => [[:Hamburger, :Hamburger], [1, 1], [9.0]]
2.2.3 :006 > shop.confirm_order
"Thank you! Your order was placed and will be delivered before 11:39"
```
