TAKEAWAY CHALLENGE

Synopsis
--------
The programm creates a takeaway app that allows a customer to select dishes from a menu and adds them to the basket. After the price is checked the order is either rejected or confirmed, in the latter case the customer receives an order confirmation via sms. In this approach the restaurant receives the menu from the menu class and displays it to the customer. The customer places the order, once complete and confirmed the order is send back to the restaurant. The restaurant then relies on the messager class to send out the confirmation.


Code Example
------------

'''2.2.3 :002 > restaurant = Restaurant.new
 => #<Restaurant:0x007ff36983e140 @menu_class=#<Menu:0x007ff36983e118>, @messager_class=#<Messager:0x007ff36983e050>>
2.2.3 :003 > order = Order.new
 => #<Order:0x007ff3691fd8d0 @restaurant_class=#<Restaurant:0x007ff3691fd830 @menu_class=#<Menu:0x007ff3691fd808>, @messager_class=#<Messager:0x007ff3691fd7e0>>, @basket={}>
2.2.3 :004 > restaurant.display_menu
 => {"Crispy Rolls"=>"3.95", "Chicken Soup"=>"4.25", "Pork Dumplings"=>"5.45", "Sweet & Sour"=>"7.45", "Black Bean Beef"=>"7.45", "Crispy Duck"=>"8.95", "Chow Mein"=>"6.45", "Fried Rice"=>"6.45", "Broccoli"=>"5.95"}
2.2.3 :005 > order.add('Chicken Soup', 2)
 => 2
2.2.3 :006 > order.add('Black Bean Beef', 1)
 => 1
2.2.3 :007 > order.basket
 => {"Chicken Soup"=>2, "Black Bean Beef"=>1}
2.2.3 :008 > order.add('Crispy Duck')
 => 1
2.2.3 :009 > order.basket
 => {"Chicken Soup"=>2, "Black Bean Beef"=>1, "Crispy Duck"=>1}
2.2.3 :010 > order.summary
 => {"Chicken Soup"=>"8.95", "Black Bean Beef"=>"7.45", "Crispy Duck"=>"8.50"} '''



Motivation
----------
Second weekend challenge, forked from MakersAcademy.


Progress
--------
Missing method in order class and spec. Dotenv also missing. Some tests still need refactoring.


Author
------
HannaEb