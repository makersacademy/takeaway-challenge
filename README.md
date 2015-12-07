#Takeaway Challenge [![Build Status](https://travis-ci.org/hibreez/takeaway-challenge.svg?branch=master)](https://travis-ci.org/hibreez/takeaway-challenge)[![Coverage Status](https://coveralls.io/repos/hibreez/takeaway-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/hibreez/takeaway-challenge?branch=master)

A Takeaway restaurant ordering system for the [takeaway challenge]
(https://github.com/makersacademy/takeaway-challenge), 
using [twilio-ruby](https://github.com/twilio/twilio-ruby) to send a text to confirm orders.  

A `Takeaway`
* displays it's `Menu` as a formatted list of dishes and prices,  
* accepts user's `Order`s in plain text and confirms their price,   
* uses it's `Phone` to send SMS messages with a delivery time.   


####Installation  
```
git clone git@github.com:hibreez/takeaway-challenge.git  
cd takeaway-challenge  
gem install bundle  
bundle
```
To receive the SMS messages you will to make a (free) 
[Twilio](https://www.twilio.com/) account and then set up three environment 
variables:  
`ACCOUNTSID=` Your Twilio Account SID.  
`AUTHTOKEN=` Your Twilio Auth Token.  
`MYPHONE=` A verified phone number to receive the messages.   


####User Stories
We are given the following user stories:
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


####Usage
The program can be used in `irb` or `pry`:
```
[1] pry(main)> require './lib/takeaway.rb'
  => true

[2] pry(main)> chinese = Takeaway.new
  => #<Takeaway:0x007fb1438476e0
  @order_klass=Order,
  @phone=#<Phone:0x0... @client=<Twilio::REST::Client @account_sid=***>>,
  @the_menu=#<Menu:0x0...>>

[3] pry(main)> chinese.menu
  Spring Rolls.............£2.99
  Crispy Duck..............£6.99
  => {"Spring Rolls"=>2.99, "Crispy Duck"=>6.99}

[4] pry(main)> chinese.place_order('99 Carrots', 9.99)
  RuntimeError: Cannot place order: Carrots not available!
  from .../takeaway-challenge/lib/takeaway.rb:23:in `place_order'

[5] pry(main)> chinese.place_order('2 Spring Rolls, 1 Crispy Duck', 11.97)
  RuntimeError: Cannot place order: total does not match pricing!
  from .../takeaway-challenge/lib/takeaway.rb:24:in `place_order'

[6] pry(main)> chinese.place_order('2 Spring Rolls, 1 Crispy Duck', 12.97)
  => <Twilio::REST::Message @path=/2010-04-01/Accounts/***/Messages/***>
```
