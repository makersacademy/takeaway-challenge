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

About a program
---------------

This program simulates TakeAway software behaviour with the following user stories
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
My approach
-----------

I have created two classes:
* Menu class - initialises menu list
* TakeAway class - shows the menu list, takes orders and saves them in basket,
  allows to view the basket and returns total price for the order. It also lets
  to complete the order and sends sms confirmation when order is completed.

For sms confirmation I used Twilio API and for tests Rspec (100% test coverage).

If I had more time I would use VCR for network stubbing to test my program interaction with Twilio.
Plus I would work on passing 100% Rubocop, as my code has 2 offences 'Style/NumericLiterals: Use underscores ( _ ) as decimal mark and separate every 3 digits' as I used phone numbers inside the TakeAway class. If I used VCR or I saved phone numbers for Twilio in ENV vars that would solve the offences. I will look into it later.

User instruction
----------------
* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Start the program in IRB, require file and create TakeAway object
```
2.5.0 :001 > require './lib/take_away'
 => true
2.5.0 :002 > takeaway = TakeAway.new
 => #<TakeAway:0x00007fe73ea54240 @menu=#<Menu:0x00007fe73ea54218 @list={"southern chicken"=>5.59, "chicken curry"
=>5.49, "jerk chicken"=>5.59, "mamas meatballs"=>5.39, "kofta patties"=>5.99, "pasta primavera"=>4.99, "vegan mous
saka"=>5.29}>, @basket={}, @total=0.0>
```
* Use 'read_menu' method to see the list of available dishes with prices. Use 'order' method to place an order and you will see the confirmation that item is added to your basket. You can pass the quantity with the name of the dish. If you do not specify quantity one item will be added. There is also 'basket_summary' method and 'total' to check what you ordered and how much it will cost you. To finalise the order, use 'checkout' method and pass the number which equals total price confirmed to you when you run 'total' method. Program will raise an error message if number passed is incorrect or send text message with the confirmation of the order otherwise. If you want to receive text message to your phone replace phone number in file take_away.rb line 54.

#Example
```
2.5.0 :003 > takeaway.read_menu
 => {"southern chicken"=>5.59, "chicken curry"=>5.49, "jerk chicken"=>5.59, "mamas meatballs"=>5.39, "kofta pattie
s"=>5.99, "pasta primavera"=>4.99, "vegan moussaka"=>5.29}
2.5.0 :004 > takeaway.order("southern chicken")
 => "1x southern chicken(s) added to your basket"
2.5.0 :005 > takeaway.order("kofta patties", 2)
 => "2x kofta patties(s) added to your basket"
2.5.0 :006 > takeaway.basket_summary
 => "southern chicken x1 = £5.59, kofta patties x2 = £11.98"
2.5.0 :007 > takeaway.total
 => "Total: £17.57"
2.5.0 :008 > takeaway.checkout(17.50)
Traceback (most recent call last):
        3: from /Users/asiaantczak/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):8
        1: from /Users/asiaantczak/Documents/Projects/week_2/weekend_challenge/takeaway-challenge/lib/take_away.rb
:37:in `checkout'
RuntimeError (Check your total as it is incorrect)
2.5.0 :009 > takeaway.checkout(17.57)
 => <Twilio.Api.V2010.MessageInstance account_sid: AC0f959b75e37138db00db732e733646c1 api_version: 2010-04-01 body
: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 23:48 date_c
reated: 2018-04-29 21:48:18 +0000 date_updated: 2018-04-29 21:48:18 +0000 date_sent:  direction: outbound-api erro
r_code: 0 error_message:  from: +441494372502 messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 pric
e_unit: USD sid: SM8461d07e3f3c484abdc4ef08a7d26749 status: queued subresource_uris: {"media"=>"/2010-04-01/Accoun
ts/AC0f959b75e37138db00db732e733646c1/Messages/SM8461d07e3f3c484abdc4ef08a7d26749/Media.json"} to: +447459387589 u
ri: /2010-04-01/Accounts/AC0f959b75e37138db00db732e733646c1/Messages/SM8461d07e3f3c484abdc4ef08a7d26749.json>
```
