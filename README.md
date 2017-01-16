Takeaway Challenge
==================
[![Build Status](https://travis-ci.org/mbgimot/takeaway-challenge.svg?branch=master)](https://travis-ci.org/mbgimot/takeaway-challenge)
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

Task
-----
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

Installation Instructions
-----
Clone the repository from [github](https://github.com/mbgimot/takeaway-challenge) and then move to that repository.

```
$ git clone git@github.com:mbgimot/takeway-challenge.git
$ cd takeaway-challenge
```

Load dependencies with bundle
```
$ gem install bundle
$ bundle install
```

Load the app in IRB
```
irb
2.3.1 :001 > require './lib/order.rb'
```

This program uses the ```twilio-ruby``` gem to send order confirmation texts. In order for them to work, the following environment variables need to be set, either in ```.bash_profile``` or using the ```envyable``` gem:

* TWILIO_SID - Twilio Account SID  
* TWILIO_KEY - Twilio Auth Token  
* TO_NUMBER - Phone number for receiving messages  
* TWILIO_NUM - Twilio-verified phone number for sending messages  

Interface
-----
```
2.3.1 :002 > cafe = Restaurant.new
 => #<Restaurant:0x007fa78a02da80 @menu=#<Menu:0x007fa78a02da58 @dishes=[#<Dish:0x007fa78a02d9e0 @name="chicken_tikka", @price=5>, #<Dish:0x007fa78a02d918 @name="orange_juice", @price=2>, #<Dish:0x007fa78a02d8a0 @name="onion_bhaji", @price=3>], @dish_class=Dish>>
2.3.1 :003 > order = Order.new
 => #<Order:0x007fa78a27edc0 @meal=#<Meal:0x007fa78a27ed98 @prices=[], @selected_dishes=[], @total_price=0>, @text=#<Text:0x007fa78a27ed20>, @basket=[]>
2.3.1 :004 > order.view_dishes(cafe)
 => [#<Dish:0x007fa78a02d9e0 @name="chicken_tikka", @price=5>, #<Dish:0x007fa78a02d918 @name="orange_juice", @price=2>, #<Dish:0x007fa78a02d8a0 @name="onion_bhaji", @price=3>]
2.3.1 :005 > #order.select_dishes(restaurant, *dishes)
2.3.1 :006 >   order.select_dishes(cafe, "orange_juice")
 => [#<Dish:0x007fa78a02d918 @name="orange_juice", @price=2>]
2.3.1 :007 > order.delete_meal
 => []
2.3.1 :008 > order.select_dishes(cafe, "orange_juice", "chicken_tikka")
 => [#<Dish:0x007fa78a02d9e0 @name="chicken_tikka", @price=5>, #<Dish:0x007fa78a02d918 @name="orange_juice", @price=2>]
2.3.1 :009 > order.price
 => 7
2.3.1 :010 > order.basket
 => [#<Dish:0x007fa78a02d9e0 @name="chicken_tikka", @price=5>, #<Dish:0x007fa78a02d918 @name="orange_juice", @price=2>]
2.3.1 :011 > #order.checkout(price)
2.3.1 :012 >   order.checkout(7)
 => "Thank you! Your order came to £7. You can expect your delivery at 11:10am"
```

Further Developments
-----
* Add feature so multiple quantities of a dish can be purchased with active stock count
* Ability to order via text
* Discounts
* Sample menu stored in a database

Contributors
-----
Mitchell Goldbay [github](https://github.com/mbgimot/) [mitchellgoldbay@gmail.com](mailto: mitchellgoldbay@gmail.com)
