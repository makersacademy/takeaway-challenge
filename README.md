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
Takeaway program created to the following specification:
* Allow customers to view a Takeaway menu
* Allow customers to order dishes from this menu
* Allow customers to check the order total
* Allow customers to receive a text message after paying for their order. This message should include a delivery time and confirmation of the order total.

How to Use
==========
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Open a REPL and start ordering!

Notes
=====
Twilio Setup
------------
The SMS class I have created uses environment variables. These have been set up using dotenv-rails, which requires a .env file in the repository. This .env file includes the following environmental variables:
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
* #add_item - to add a dish to the menu, including its cost
* #remove_item - to remove a dish from the menu
* #change_item_cost - to edit the price of the item

I would also like to refactor the code so that the Order class does not have any dependency on the Menu module. At the moment, the Order class puts menu items in to the basket by receiving the item number from the Takeaway class, and finding the correct item from the Menu module using this number.

VCR & Webmock
-------------
In order to test my SMS class and Twilio, I have used the VCR and Webmock gems. Information on these can be found [here](https://github.com/makersacademy/course/blob/master/pills/levels_of_stubbing.md)

TDD
---
While every effort was taken to follow the TDD cycle, using external API for the first time meant that I had no idea where to start with unit testing! Ultimately the SMS test was implemented after the code was written. I also struggle with unit testing when class interactions are involved. The tests may be refactored in future.

Example Order
=============
The takeaway is initialized with the SMS and Order classes. Orders are placed by entering the item number and quantity you wish to purchase. Example from Pry below:

(Yes, my Pry has a turtle. Adding that was the highlight of my week, so enjoy!)
```
 🐢  : require './lib/takeaway.rb'
=> true
 🐢  : takeaway = Takeaway.new(SMS, Order)
=> #<Takeaway:0x007f87c9bd3aa0 @order_klass=Order, @sms_klass=SMS>
 🐢  : takeaway.place_order(9,2)
=> [{:number=>9, :item=>"Fries", :cost=>"£1.50"},
 {:number=>9, :item=>"Fries", :cost=>"£1.50"}]
 🐢  : takeaway.pay(3.00)
=> nil
```

This led to my phone receiving the following text message:
```
Sent from your Twilio trial account - Thank you. Received payment of £3.00. Your order will be delivered by 19:08
```

Travis CI status badge [![Build Status](https://travis-ci.org/kwilson541/takeaway-challenge.svg?branch=master)](https://travis-ci.org/kwilson541/takeaway-challenge)