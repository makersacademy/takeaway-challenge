Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

How to use this program
-------
* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Use Ruby version 2.3.7
* Check below for each user story and the methods they use


```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

irb
require './lib/takeaway_service'
tas = TakeawayService.new
tas.view_menu

2.3.7 :001 > require './lib/takeaway_service'
 => true
2.3.7 :002 > tas = TakeawayService.new
 => #<TakeawayService:0x00007f9651365558 @menu_class=#<Menu:0x00007f9651365530 @menu_items={:Starters=>[["Soup", "3.50"], ["Fritter", "4"]], :Mains=>[["Chicken", "8.50"], ["Lasagne", "7.50"]], :Deserts=>[["Crumble", "3.50"], ["Icecream", "3"]]}>, @basket={}>
2.3.7 :003 > tas.view_menu
Starters:
Soup - £3.50
Fritter - £4
Mains:
Chicken - £8.50
Lasagne - £7.50
Deserts:
Crumble - £3.50
Icecream - £3
 => nil



As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

  irb
  require './lib/takeaway_service'
  tas = TakeawayService.new
  tas.add_to_basket("Chicken", 2)
  tas.add_to_basket("Soup", 4)
  tas.basket

    2.3.7 :001 > require './lib/takeaway_service'
     => true
    2.3.7 :002 > tas = TakeawayService.new
     => #<TakeawayService:0x00007fefb83da220 @menu_class=#<Menu:0x00007fefb83da1f8 @menu_items={:Starters=>[["Soup", "3.50"], ["Fritter", "4"]], :Mains=>[["Chicken", "8.50"], ["Lasagne", "7.50"]], :Deserts=>[["Crumble", "3.50"], ["Icecream", "3"]]}>, @basket={}>
    2.3.7 :003 > tas.add_to_basket("Chicken", 2)
     => "2 Chicken(s) added to your basket"
    2.3.7 :004 > tas.add_to_basket("Soup", 4)
     => "4 Soup(s) added to your basket"
    2.3.7 :005 > tas.basket
     => {"Chicken"=>2, "Soup"=>4}

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

  irb
  require './lib/takeaway_service'
  tas = TakeawayService.new
  tas.add_to_basket("Chicken", 2)
  tas.add_to_basket("Soup", 4)
  tas.order_summary

    2.3.7 :001 > require './lib/takeaway_service'
     => true
    2.3.7 :002 > tas = TakeawayService.new
     => #<TakeawayService:0x00007fa62c387410 @menu_class=#<Menu:0x00007fa62c3873e8 @menu_items={:Starters=>[["Soup", "3.50"], ["Fritter", "4"]], :Mains=>[["Chicken", "8.50"], ["Lasagne", "7.50"]], :Deserts=>[["Crumble", "3.50"], ["Icecream", "3"]]}>, @basket={}>
    2.3.7 :003 > tas.add_to_basket("Chicken", 2)
     => "2 Chicken(s) added to your basket"
    2.3.7 :004 > tas.add_to_basket("Soup", 4)
     => "4 Soup(s) added to your basket"
    2.3.7 :005 > tas.order_summary
    Chicken x2 = £17.0, Soup x4 = £14.0 => nil

  irb
  require './lib/takeaway_service'
  tas = TakeawayService.new
  tas.add_to_basket("Chicken", 2)
  tas.add_to_basket("Soup", 4)
  tas.total_cost

    2.3.7 :001 > require './lib/takeaway_service'
     => true
    2.3.7 :002 > tas = TakeawayService.new
     => #<TakeawayService:0x00007fda7fd85d40 @menu_class=#<Menu:0x00007fda7fd85d18 @menu_items={:Starters=>[["Soup", "3.50"], ["Fritter", "4"]], :Mains=>[["Chicken", "8.50"], ["Lasagne", "7.50"]], :Deserts=>[["Crumble", "3.50"], ["Icecream", "3"]]}>, @basket={}>
    2.3.7 :003 > tas.add_to_basket("Chicken", 2)
     => "2 Chicken(s) added to your basket"
    2.3.7 :004 > tas.add_to_basket("Soup", 4)
     => "4 Soup(s) added to your basket"
    2.3.7 :005 > tas.total_cost
    £31.0 => nil

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  irb
  require './lib/takeaway_service'
  tas = TakeawayService.new
  tas.add_to_basket("Chicken", 2)
  tas.place_order

    2.3.7 :001 > require './lib/takeaway_service'
    => true
    2.3.7 :002 > tas = TakeawayService.new
    => #<TakeawayService:0x00007fbd7c5a3b10 @menu_class=#<Menu:0x00007fbd7c5a3ae8 @menu_items={:Starters=>[["Soup", "3.50"], ["Fritter", "4"]], :Mains=>[["Chicken", "8.50"], ["Lasagne", "7.50"]], :Deserts=>[["Crumble", "3.50"], ["Icecream", "3"]]}>, @basket={}>
    2.3.7 :003 > tas.add_to_basket("Chicken", 2)
    => "2 Chicken(s) added to your basket"
    2.3.7 :004 > tas.place_order
    => "Thank you! Your order was placed and will be delivered before 8:12"




```
