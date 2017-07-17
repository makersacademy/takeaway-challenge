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

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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
IRB
2.4.0 :002 > require_relative "lib/take_away_menu.rb"
 => true
2.4.0 :003 > china_town = TakeAwayMenu.new
 => #<TakeAwayMenu:0x007fac108abd58 @menu={:tuna=>4, :frog=>1, :lamb=>2, :pork=>3}, @order=#<Order:0x007fac108abcb8 @menu={:tuna=>4, :frog=>1, :lamb=>2, :pork=>3}, @order={}, @total=0>>
2.4.0 :004 > china_town.print_menu
---Menu---
tuna       €4
frog       €1
lamb       €2
pork       €3
---Menu---
2.4.0 :006 > china_town.add_item_to_order("frog", 300)
 => {:frog=>[1, 300]}
2.4.0 :007 > china_town.add_item_to_order("pork", 300)
 => {:frog=>[1, 300], :pork=>[3, 300]}
2.4.0 :008 > china_town.check_order
---Your Shopping List---
frog      300 €1
pork      300 €3
--- Total = €1200 ---
 => nil
2.4.0 :009 > china_town.place_order(1200)
 => "Thank you! Your order was placed and will be delivered before 7:50"
2.4.0 :010 >
