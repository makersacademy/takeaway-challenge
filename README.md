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
Makers Academy Week 02 Weekend Challenge <br>
Author: Rhiannon Lolley Neville <br>

[![Build Status](https://travis-ci.org/rhiannonruth/takeaway-challenge.svg?branch=master)](https://travis-ci.org/rhiannonruth/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/rhiannonruth/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/rhiannonruth/takeaway-challenge?branch=master)

Task
-------
Write a Takeaway program with the following user stories:
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
-------
* Fork this repo.
* Run the command ```bundle install``` in the root directory to install dependancies.
* The twilio-ruby gem is use for text messaging capabilities. An account is required, visit https://www.twilio.com/ to create a free one.
* The dotenv-rails gem is used to store sensitive information in environment variables. Create a ```.env``` file in the root directory to store the following variables : ACCOUNT_SID, AUTH_TOKEN, FROM_PHONE_NUMBER, TO_PHONE_NUMBER

IRB sample
-------
```
2.2.3 :001 > require './lib/order'
 => true
2.2.3 :002 > menu = Menu.new
 => #<Menu:0x007fe1f29d7700 @menu={}>
2.2.3 :003 > menu.add_to_menu("Burger", 6.95)
 => 6.95
2.2.3 :004 > menu.add_to_menu("Chips", 3.25)
 => 3.25
2.2.3 :005 > menu.add_to_menu("Side Salad", 3.50)
 => 3.5
2.2.3 :006 > order = Order.new(menu)
 => #<Order:0x007fe1f308c0f0 @basket={}, @menu=#<Menu:0x007fe1f29d7700 @menu={"Burger"=>6.95, "Chips"=>3.25, "Side Salad"=>3.5}>, @sms_sender=#<SmsSender:0x007fe1f3087f28>>
2.2.3 :007 > order.view_menu
 => {"Burger"=>6.95, "Chips"=>3.25, "Side Salad"=>3.5}
2.2.3 :008 > order.add_to_basket("Burger", 2)
 => 2
2.2.3 :009 > order.add_to_basket("Chips")
 => 1
2.2.3 :010 > order.add_to_basket("Side Salad")
 => 1
2.2.3 :011 > order.basket
 => {"Burger"=>2, "Chips"=>1, "Side Salad"=>1}
2.2.3 :012 > order.checkout(20.65)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/ACed1ca2e66c372a7021e2609cb666853e/Messages/SM4304cbaf4f8840a382b3bb95eb427586>
 ```
