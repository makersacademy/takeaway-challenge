Takeaway Challenge
==================

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)

```
                            _________
              r==           |  M.A. |
           _  //            |   &   |   ))))
          |_)//(''''':      |  D.R. |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

 The Task
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
 [Link to Makers Academy's instructions](https://github.com/dylanrhodius/takeaway-challenge/blob/master/MA_Instructions.md)

 My Approach to the Task
 -----


 Installing the APP
 -----
 Clone the repository from [GitHub](https://github.com/dylanrhodius/takeaway-challenge) and then move into that repository.

 ```
 $ git clone git@github.com:dylanrhodius/takeaway-challenge.git
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
 ```

 Using the APP
 -----
 ```
 2.3.1 :001 > require './lib/restaurant'
 => true
2.3.1 :002 > require './lib/dish'
 => true
2.3.1 :003 > require './lib/menu'
 => true
2.3.1 :004 > require './lib/order'
 => true
2.3.1 :005 > require './lib/messenger'
 => true
2.3.1 :006 > choripan = Dish.new(:choripan, 5.95)
 => #<Dish:0x007fe686ad8328 @name=:choripan, @price=5.95>
2.3.1 :007 > milanesa = Dish.new(:milanesa, 7.95)
 => #<Dish:0x007fe686ac9738 @name=:milanesa, @price=7.95>
2.3.1 :008 > empanada = Dish.new(:empanada, 2.95)
 => #<Dish:0x007fe686abadf0 @name=:empanada, @price=2.95>
2.3.1 :009 > lomito = Dish.new(:lomito, 12.75)
 => #<Dish:0x007fe686aaabd0 @name=:lomito, @price=12.75>
2.3.1 :010 > menu1 = Menu.new(choripan, lomito, milanesa, empanada)
 => #<Menu:0x007fe6860fad88 @menu_items={:choripan=>5.95, :lomito=>12.75, :milanesa=>7.95, :empanada=>2.95}>
2.3.1 :011 > menu2 = Menu.new(empanada, milanesa)
 => #<Menu:0x007fe6860e8188 @menu_items={:empanada=>2.95, :milanesa=>7.95}>
2.3.1 :012 > order1 = Order.new(menu1)
 => #<Order:0x007fe6860d9430 @menu=#<Menu:0x007fe6860fad88 @menu_items={:choripan=>5.95, :lomito=>12.75, :milanesa=>7.95, :empanada=>2.95}>, @current_order={}, @total_cost=0>
2.3.1 :013 > order1.add_item(lomito)
 => 12.75
2.3.1 :014 > order1.add_item(empanada, 6)
 => 30.45
2.3.1 :015 > moo = Restaurant.new(order1)
 => #<Restaurant:0x007fe686a9a730 @order=#<Order:0x007fe6860d9430 @menu=#<Menu:0x007fe6860fad88 @menu_items={:choripan=>5.95, :lomito=>12.75, :milanesa=>7.95, :empanada=>2.95}>, @current_order={#<Dish:0x007fe686aaabd0 @name=:lomito, @price=12.75>=>1, #<Dish:0x007fe686abadf0 @name=:empanada, @price=2.95>=>6}, @total_cost=30.45>, @message=#<Messenger:0x007fe686a9a708>>
2.3.1 :016 > moo.order.current_order
 => {#<Dish:0x007fe686aaabd0 @name=:lomito, @price=12.75>=>1, #<Dish:0x007fe686abadf0 @name=:empanada, @price=2.95>=>6}
2.3.1 :017 > moo.order.current_order
 => {#<Dish:0x007fe686aaabd0 @name=:lomito, @price=12.75>=>1, #<Dish:0x007fe686abadf0 @name=:empanada, @price=2.95>=>6}
2.3.1 :018 > moo.order
 => #<Order:0x007fe6860d9430 @menu=#<Menu:0x007fe6860fad88 @menu_items={:choripan=>5.95, :lomito=>12.75, :milanesa=>7.95, :empanada=>2.95}>, @current_order={#<Dish:0x007fe686aaabd0 @name=:lomito, @price=12.75>=>1, #<Dish:0x007fe686abadf0 @name=:empanada, @price=2.95>=>6}, @total_cost=30.45>
2.3.1 :019 > moo.order.finalise_order(10)
RuntimeError: Incorrent amount confirmed. Our total came up to: £30.45.
	from /Users/dylanrhodius/Documents/MA/weekend_challenges/takeaway_challenge/lib/order.rb:19:in `finalise_order'
	from (irb):19
	from /Users/dylanrhodius/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
2.3.1 :020 > moo.order.finalise_order(30.45)
 => true
2.3.1 :021 > moo.confirm_order
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/ACfff799e051784d0354ce70ccd5b7e881/Messages/SMf92677e57b5c472d8766fb3d9bcc6a84>
2.3.1 :022 > exit

Phone receives text message as confirmation:
"Thank you for placing an order!
The total is £30.45.
It will be arriving at 23:44."
 ```
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg)](https://coveralls.io/github/makersacademy/takeaway-challenge)
