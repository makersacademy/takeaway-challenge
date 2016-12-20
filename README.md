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

Description
===========
This is the Week 2 weekend challenge from Makers Academy. The challenge was to design a takeaway to the following specification:

* Allow customers to view a Takeaway menu
* Allow customers to order dishes from this menu
* Allow customers to check the order total
* Allow customers to receive a text message after paying for their order. This message should include a delivery time and confirmation of the order total.

The project consists of a Takeaway, Order, and SMS class, and a Menu module which is required by the Takeaway and Order classes.

Technologies
============
* Code was written in Ruby
* Testing was done using RSpec
* Coveralls has been used to assess test coverage
* Travis CI has been used to check build status
* Twilio API has been used for sending SMS messages
* DotEnv has been used to store environment variables

How to Install
==============
1. Fork this repo
2. Clone the forked repo to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

How to Use
==========
1. Open a terminal and navigate to the project folder
2. Run `irb` or `pry` (I prefer to use Pry)
3. Require `./lib/takeaway`
4. Start Ordering!

Notes
=====
Twilio Setup
------------
The SMS class I have created uses environment variables. These have been set up using dotenv, which requires a .env file in the root of the repository. This .env file includes the following environmental variables:
* TWILIO_ACCOUNT_SID='twilio account sid'
* TWILIO_AUTH_TOKEN='twilio auth token'
* TWILIO_PHONE='twilio phone number'
* TWILIO_DESTINATION_PHONE='number of phone to receive texts'

The .env file will need to be created and include the variables listed above in order for you to receive text messages using this program.

You can set up a free Twilio account [here](https://www.twilio.com/).
You can find further information on dotenv [here](https://www.twilio.com/blog/2015/02/managing-development-environment-variables-across-multiple-ruby-applications.html)

Menu Module
-----------
As there was no requirement to have the ability to create or edit a menu, the menu in this project is static and has been created as a module. If this project were to be extended and require the ability for new takeaway instances to create their own menus, I would convert Menu to a class with additional methods such as:
* `#add_item` - to add a dish to the menu, including its cost
* `#remove_item` - to remove a dish from the menu
* `#change_item_cost` - to edit the price of the item

I would also like to refactor the code so that the Order class does not have any dependency on the Menu module. At the moment, the Order class puts menu items in to the basket by receiving the item number from the Takeaway class, and finding the correct item from the Menu module using this number.

TDD
---
While every effort was taken to follow the TDD cycle, using external API for the first time meant that I had no idea where to start with unit testing! Ultimately the SMS test was implemented after the code was written, using doubles so that no text messages would be sent when tests are run.

Example Order
=============

Creating a new takeaway. The takeaway is initialized with the SMS and Order classes.
```
 🐢 : require './lib/takeaway.rb'
=> true
 🐢 : takeaway = Takeaway.new(SMS, Order)
=> #<Takeaway:0x007fcc54968228 @order_klass=Order, @sms_klass=SMS>
```

Viewing the menu
```
 🐢 : takeaway.view_menu
=> [{:number=>1, :item=>"Cheese Pizza", :cost=>"£5.99"},
 {:number=>2, :item=>"Pepperoni Pizza", :cost=>"£6.99"},
 {:number=>3, :item=>"Vegetarian Pizza", :cost=>"£6.99"},
 {:number=>4, :item=>"Hawaiian Pizza", :cost=>"£6.99"},
 {:number=>5, :item=>"Chicken Burger", :cost=>"£3.50"},
 {:number=>6, :item=>"Beef Burger", :cost=>"£3.50"},
 {:number=>7, :item=>"Garlic Bread", :cost=>"£2.99"},
 {:number=>8, :item=>"Onion Rings", :cost=>"£1.99"},
 {:number=>9, :item=>"Fries", :cost=>"£1.50"},
 {:number=>10, :item=>"Ice Cream", :cost=>"£3.99"}]
```

Order items by specifying the menu number and quantity you wish to purchase
```
 🐢 : takeaway.place_order(5, 2)
=> [{:number=>5, :item=>"Chicken Burger", :cost=>"£3.50"},
 {:number=>5, :item=>"Chicken Burger", :cost=>"£3.50"}]
 🐢 : takeaway.place_order(9, 2)
=> [{:number=>5, :item=>"Chicken Burger", :cost=>"£3.50"},
 {:number=>5, :item=>"Chicken Burger", :cost=>"£3.50"},
 {:number=>9, :item=>"Fries", :cost=>"£1.50"},
 {:number=>9, :item=>"Fries", :cost=>"£1.50"}]
```

Try to pay the wrong amount for your order!
```
 🐢 : takeaway.pay(8.00)
RuntimeError: Payment amount is incorrect.
```

Check the cost of your order
```
 🐢 : takeaway.check_total
=> "Total: £10.00"
```

Pay the correct amount for your order
```
 🐢 : takeaway.pay(10.00)
=> nil
```

This led to my phone receiving the following text message:
```
Sent from your Twilio trial account - Thank you. Received payment of £10.00. Your order will be delivered by 17:01
```

Optional: If you wish to run the tests for this project, enter `rspec` into your command line. If you wish to view the test coverage, enter `coveralls report` into your command line.

Travis CI status badge [![Build Status](https://travis-ci.org/kwilson541/takeaway-challenge.svg?branch=master)](https://travis-ci.org/kwilson541/takeaway-challenge)