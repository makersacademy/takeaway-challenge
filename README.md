#Project Name: Takeaway Challenge

#Week 2 of Makers Academy
--------------------------

The key learning objectives for this challenge were focused around effective object oriented programming. We were looking to display the SOLID principles, focusing on the Single Responsibility Principle and Open/Closed Principle. 

Author
--------

Russell Vaughan

Features of program
--------------------

This is a replica of a online takeaway system. They program would allow a user to look a restaurants menu, select multiple items from the menu, add them to a basket, view their order and subtotal, and finally place the order. The Twilo gem is required so that when an order is placed, a confirmation text messages gets sent to the user's phone.

Installation and example use
----------------------------

```
2.2.3 :001 > require './lib/takeaway.rb'
 => true 
2.2.3 :002 > russells_takeaway=Takeaway.new
 => #<Takeaway:0x007fde5116efe0 @menu=#<Menu:0x007fde5116efb8>, @dishes={"Roast Pork Belly Hirata Buns"=>5, "Salt & Pepper Squid"=>4, "Sesame Glazed Squid"=>5, "Char Siu Pork Bao"=>5, "Crispy Seaweed"=>3}, @order=[]> 
2.2.3 :003 > russells_takeaway.list_menu
Dish: Roast Pork Belly Hirata Buns, Price: £5
Dish: Salt & Pepper Squid, Price: £4
Dish: Sesame Glazed Squid, Price: £5
Dish: Char Siu Pork Bao, Price: £5
Dish: Crispy Seaweed, Price: £3
 => nil 
2.2.3 :004 > russells_takeaway.select_item "Char Siu Pork Bao"
 => "you added 1 Char Siu Pork Bao to your basket" 
2.2.3 :005 > russells_takeaway.select_item "Crispy Seaweed", 2
 => "you added 2 Crispy Seaweed to your basket" 
2.2.3 :006 > russells_takeaway.order_summary
Your order summary is:
 1 x Char Siu Pork Bao, £5
 2 x Crispy Seaweed, £6
 Total cost: £11
 => nil 
2.2.3 :007 > russells_takeaway.place_order 11
 => "Thank you! Your order was placed and will be delivered before 19:25" 

 Key Learnings:
 --------------

 Class Extraction
 Dependency Injection
 T.D.D.
 Requiring Gems
