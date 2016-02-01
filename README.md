Takeaway Challenge
==================
[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg?branch=ZeshanRasul)](https://coveralls.io/github/makersacademy/takeaway-challenge?branch=ZeshanRasul)

This is the Week 2 Takeaway Challenge by Zeshan Rasul.

I began this challenge using the following User Stories as direction. 
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
I have made three classes for the application: 'Menu', 'Order' and 'Text'.  As well as three corresponding spec files for testing purposes. 

I have included an IRB transcript below which demonstrates how the application would be used.

```
2.2.3 :001 > require './lib/order.rb'
 => true 
2.2.3 :002 > order = Order.new
 => #<Order:0x000000018689f8 @menu_klass=#<Menu:0x00000001868980>, @text_klass=#<Text:0x00000001868930 @credentials={"TWILIO_SID"=>"******", "TWILIO_AUTH_TOKEN"=>"******", "TWILIO_NUMBER"=>"******", "MY_NUMBER"=>"******"}>, @chosen_items={}, @final_bill=0, @number_of_dishes=0> 
2.2.3 :003 > order.show_menu
 => {:Crispy_Duck=>7.5, :Spring_Rolls=>3.5, :Special_Fried_Rice=>2.5, :Egg_Fried_Rice=>2.0, :Prawn_Crackers=>1.2, :Chicken_Chow_Mein=>5.5, :King_Prawn_Chow_Mein=>6.5, :Chicken_in_Black_Bean_Sauce=>5.5, :Coke=>1.0, :Sprite=>1.0} 
2.2.3 :004 > order.order_selection(:Crispy_Duck, 2)
 => 2 
2.2.3 :005 > order.order_selection(:Egg_Fried_Rice, 3)                            
 => 3 
2.2.3 :006 > order.order_selection(:Coke, 3)
 => 3 
2.2.3 :007 > order.check_order
 => {:Crispy_Duck=>2, :Egg_Fried_Rice=>3, :Coke=>3} 
2.2.3 :008 > order.order_summary
 => "Crispy_Duck x 2 = £15.00, Egg_Fried_Rice x 3 = £6.00, Coke x 3 = £3.00" 
2.2.3 :009 > order.order_selection(:Prawn_Crackers, 3)
 => 3 
2.2.3 :010 > order.check_order
 => {:Crispy_Duck=>2, :Egg_Fried_Rice=>3, :Coke=>3, :Prawn_Crackers=>3} 
2.2.3 :011 > order.show_bill
 => "£27.60" 
2.2.3 :012 > order.finalize_order
 => [Details removed - Twilio text confirmation sent]
 ```
 
 When a new order is created, a user is able to display the menu with the show_menu command.  This lists the items and their prices in a hash.  The order_selection command can then be used to select the dish and a quantity.  They are able to check their order size using check_order, which will display the dishes and quantity of each.  Order_summary allows the user to check dishes, quantity and price for each type of dish.  Further dishes can be added and show_bill can be used to check the total amount payable.  Finally, the user can use the finalize_order command and will receive the text confirmation through the twilio gem.
 
 Tests have been implemented to ensure that selections return the correct dishes and that calculations made are exact, returning the correct price for the customer.
 
 In future, the application can be expanded by allowing for orders to be made by text. 
