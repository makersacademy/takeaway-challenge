
 BUILD STATUS: ![alt text](https://travis-ci.org/olwend/takeaway-challenge.svg?branch=master)

Takeaway Challenge
==================
This challenge required the use of hashes & arrays across interacting classes.
To make this customisable for different takeaway businesses, the menu class creates a specific 'menuhash' object for a business. In this case it is called 'FoodBuddy'and the menuhash object is an instance of 'FoodBuddy' class; this could be an instance of 'Tandoori Frights' or "Joyluck lunch" class.
The initial version does not expect a full display object or UI, instead it will run in irb.

![Domain Model][logo]
[logo]:https://github.com/olwend/takeaway-challenge/blob/master/Takeaway.png
* As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices _DONE_

* As a restauranteur
So that I can plan menus
I want to be able to add and remove dishes _DONE_

* As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes _DONE_

* As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

* As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered _TEXT RECEIVED BUT CODE FOR 3 NOT DONE SO IT IS GENERIC_

Instructions
-------------
 to demo stories 1,2 & 3 in irb
* Menu instance is initialized with hash items in (menuhash)

```
2.3.1 :001 > require './lib/menu'
 => true
 1. View menu
2.3.1 :002 > menu = Menu.new

Comfortingly good for you - FoodBuddy weekday menu
--------------------------------------------------
0.Greek-style roast fish @ £ 4.59
1.Pea falafels with minty couscous salad @ £ 3.59
2.Mixed bean chilli with wedges @ £ 4.09
3.Crab & Sweetcorn chowder @ £ 4.59
4.Quinoa frittata @ £ 4.99
{"0.Greek-style roast fish"=>4.59, "1.Pea falafels with minty couscous salad"=>3.59, "2.Mixed bean chilli with wedges"=>4.09, "3.Crab & Sweetcorn chowder"=>4.59, "4.Quinoa frittata"=>4.99}
 => #<Menu:0x007fa68484fb20>

 menuhash = Foodbuddy.new
 => #<Foodbuddy:0x007fe2f481dc90 @list={"0.Greek-style roast fish"=>4.59, "1.Pea falafels with minty couscous salad"=>3.59, "2.Mixed bean chilli with wedges"=>4.09, "3.Crab & Sweetcorn chowder"=>4.59, "4.Quinoa frittata"=>4.99}>
 ```
* read contents ```menuhash.list```
*  Add hash item
 ```
 2.3.1 :024 > menuhash.add_dish("5.Mango Quorn Curry", 5.95)
 => 5.95
2.3.1 :025 > menuhash.list
 => {"0.Greek-style roast fish"=>4.59, "1.Pea falafels with minty couscous salad"=>3.59, "2.Mixed bean chilli with wedges"=>4.09, "3.Crab & Sweetcorn chowder"=>4.59, "4.Quinoa frittata"=>4.99, "5.Mango Quorn Curry"=>5.95}
 ```
*  Delete hash item
 ```
 2.3.1 :026 > menuhash.remove_dish("4.Quinoa frittata")
 => 4.99
2.3.1 :027 > menuhash.list
 => {"0.Greek-style roast fish"=>4.59, "1.Pea falafels with minty couscous salad"=>3.59, "2.Mixed bean chilli with wedges"=>4.09, "3.Crab & Sweetcorn chowder"=>4.59, "Mango Quorn Curry"=>5.95}
 ```
*  Customer selects items for order
 ```
2.3.1 :007 > choice = Select_items.new
 => #<Select_items:0x007fa6831b2048 @items=[]>

2.3.1 :008 > choice.input_items
Please enter menu number of your choice
    e.g. 0 for Greek-style roast fish

To finish order, hit return twice
3
Thankyou now enter quantity wanted
4
(AS MANY ITEMS AS WANTED - ENTERED TO ARRAY)

 => [{:id=>"3", :quantity=>"4"}, {:id=>"2", :quantity=>"4"}, {:id=>"1", :quantity=>"5"}]
```
* Order is presented back with selected items and total

* SMS is sent confirming the order and expected delivery time
 To send the text run command line
=======
 ```
 `ruby twilio_test.rb`
```
