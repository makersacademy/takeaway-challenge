#Takeaway Challenge#
--------------------
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

##Instructions##
----------------

* There are 4 classes: Takeaway, Order, Message and menu
* Main class: Takeaway - used by customers
* The menu can can modified in the Menu class

Example in irb:
--------
```
2.3.1 :001 > require './lib/takeaway'
 => true
2.3.1 :002 > t = Takeaway.new
 => #<Takeaway:0x007fb7f2aeb760 @message=#<Message:0x007fb7f2aeb6c0>, @menu=#<Menu:0x007fb7f2aeb738 @dish_list={"pizza"=>3.0, "burger"=>
2.0, "chips"=>1.0}>, @order=nil>
2.3.1 :003 > t.display_menu
 => {"pizza"=>3.0, "burger"=>2.0, "chips"=>1.0}
2.3.1 :004 > t.order "burger"
 => "1x burger(s) added to your basket. Current total: £2.0."
2.3.1 :005 > t.order "pizza", 4
 => "4x pizza(s) added to your basket. Current total: £14.0."
2.3.1 :006 > t.order "chips", 2
 => "2x chips(s) added to your basket. Current total: £16.0."
2.3.1 :007 > t.basket_summary
 => {"burger"=>1, "pizza"=>4, "chips"=>2}
2.3.1 :008 > t.total
 => "Total: £16.0"
 ```

Task
-----
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
