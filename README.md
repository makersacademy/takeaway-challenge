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

Completed User Stories
-------

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

Instructions


andreas-imac:takeaway-challenge andreawildsmith$ irb
2.3.1 :001 > require './lib/restaurant.rb'
 => true
2.3.1 :002 > r1 = Restaurant.new
 => #<Restaurant:0x007fa464261028 @menu=#<Menu:0x007fa464260fd8 @menu={"Spring Rolls"=>3, "Prawn Crackers"=>1, "Chicken Satay"=>7, "Thai Green Curry"=>8, "Rice"=>2}>, @order={}>
2.3.1 :003 > r1.display_menu
Spring Rolls
Prawn Crackers
Chicken Satay
Thai Green Curry
Rice
 => {"Spring Rolls"=>3, "Prawn Crackers"=>1, "Chicken Satay"=>7, "Thai Green Curry"=>8, "Rice"=>2}
2.3.1 :004 > r1.order_food("rice", 8)
 => "Thank you for your order: 8 => Rice."
2.3.1 :005 >
