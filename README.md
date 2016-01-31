##TAKEAWAY CHALLENGE
Mark Hill 31/1/2016

####Build software allowing users to view restaurant menus, place orders, and have orders confirmed by text message.

####Content:
User interacts through 'Takeaway' class, which contains the following functionalities included through modules: 'Calculate', which calculates the price of the order; 'Menu_Print', which displays the menu; 'Order', which allows the customer to order; 'Mail', which sends the customer a confirmation text (currently disabled); and MenuList, which enables the user to set the menu of the takeaway.

####Example

```
2.2.3 :001 > require './lib/takeaway.rb'
 => true 
2.2.3 :002 > shop = Takeaway.new
 => #<Takeaway:0x007fecdba6c2a8 @menu={:Hamburger=>4.5, :Cheeseburger=>4.6, :Chips=>1.0}> 
2.2.3 :003 > wine_shop = Takeaway.new :wine
 => #<Takeaway:0x007fecdba5de10 @menu={:red=>3.0, :white=>3.0, :blue=>10.0}> 
2.2.3 :004 > shop.show_menu
Menu:
Hamburger. Price: £4.50
Cheeseburger. Price: £4.60
Chips. Price: £1.00
 => {:Hamburger=>4.5, :Cheeseburger=>4.6, :Chips=>1.0} 
2.2.3 :005 > shop.order
Enter the name of the dish. (Enter q to quit)
Hamburger
Enter the quantity you require. (Enter q to quit)
1
You entered 1, is that correct? Enter y to continue with your order
y
Order completed
If you wish to complete your order press y; press any other key to place another order.
y
 => [[:Hamburger], [1], [4.5]] 
2.2.3 :006 > shop.confirm_order
"The message has been sent"
 => "The message has been sent" 
```

