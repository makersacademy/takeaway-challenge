Takeaway Challenge
==================
[![Build Status](https://travis-ci.org/tamarlehmann/takeaway-challenge.svg?branch=master)](https://travis-ci.org/tamarlehmann/takeaway-challenge) [![Coverage Status](https://coveralls.io/repos/github/tamarlehmann/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/tamarlehmann/takeaway-challenge?branch=master)

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

Features
-------

* An app allowing you to view dishes and price information on a menu, create an order, place and order and get an SMS confirmation with an estimated delivery time.

User Stories
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

Technologies Used
-----

* Ruby
* RSpec
* Twilio API for sending SMS confirmation
* DOTENV variables for hiding credentials

Installation and Using the App
-----

* Fork and clone this repo
* Run `bundle` to ensure all required gems exist
* Open `irb` to interact with the application:

```
2.3.3 :001 > require './lib/takeaway.rb'
 => true
2.3.3 :002 > pizza = Dish.new("Pizza", 5)
 => #<Dish:0x007ff5a3215778 @name="Pizza", @price=5>
2.3.3 :003 > pasta = Dish.new("Pasta", 4)
 => #<Dish:0x007ff5a3205490 @name="Pasta", @price=4>
2.3.3 :004 > menu = Menu.new
 => #<Menu:0x007ff5a31ec530 @dishes=[]>
2.3.3 :005 > menu.add_dish(pizza)
 => [#<Dish:0x007ff5a3215778 @name="Pizza", @price=5>]
2.3.3 :006 > menu.add_dish(pasta)
 => [#<Dish:0x007ff5a3215778 @name="Pizza", @price=5>, #<Dish:0x007ff5a3205490 @name="Pasta", @price=4>]
2.3.3 :007 > takeaway = Takeaway.new(menu)
 => #<Takeaway:0x007ff5a32ae0e0 @menu=#<Menu:0x007ff5a31ec530 @dishes=[#<Dish:0x007ff5a3215778 @name="Pizza", @price=5>, #<Dish:0x007ff5a3205490 @name="Pasta", @price=4>]>, @order=nil, @payment_total=0>
2.3.3 :008 > takeaway.create_order
 => #<Order:0x007ff5a328df20 @basket=[], @basket_total=0>
2.3.3 :009 > takeaway.order.add_item(pasta, 3)
 => "3 x Pasta added to your basket"
2.3.3 :010 > takeaway.order.add_item(pizza, 2)
 => "2 x Pizza added to your basket"
2.3.3 :011 > takeaway.place_order
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC14af48c223dba6efb2dbd0fe1b5eb900/Messages/SMec39e5280b174e3ba524e105a22b9f23>

```

Running the Tests
-----
* In the root directory run `$ rspec`. The test suite will run in the command line.
