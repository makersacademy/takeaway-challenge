Update
======

Author - Rob Youngman

Current Status
==============

RSpec passes.

The takeaway functionality of menu, add, remove, total, summary has been functionally tested.

A screenshot of a successful notification from Twilio is located in the file named twilioSMS.PNG.

Instruction for running in irb
==============================

Here's an example of ordering a pizza

```
.2.3 :001 > require './lib/menu'
 => true
2.2.3 :002 > require './lib/messenger'
 => true
2.2.3 :003 > require './lib/takeaway'
 => true
2.2.3 :004 > require './lib/restaurant'
 => true
2.2.3 :005 > messenger = Messenger.new
 => #<Messenger:0x007f8fe2be7ea8>
2.2.3 :006 > menu = Menu.new
 => #<Menu:0x007f8fe2bdcb98 @items={"Pepperoni"=>1, "Hot Shot"=>1, "Jardin"=>2, "Provencale"=>2, "Roquefort"=>3, "Neptune"=>3, "Poulet"=>4, "Four Seasons"=>4}>
2.2.3 :007 > restaurant = Restaurant.new(messenger,menu)
 => #<Restaurant:0x007f8fe2bce138 @messenger=#<Messenger:0x007f8fe2be7ea8>, @menu=#<Menu:0x007f8fe2bdcb98 @items={"Pepperoni"=>1, "Hot Shot"=>1, "Jardin"=>2, "Provencale"=>2, "Roquefort"=>3, "Neptune"=>3, "Poulet"=>4, "Four Seasons"=>4}>, @header={:from=>"+441290211165", :to=>"+447527994300"}>
2.2.3 :008 > takeaway = restaurant.request_takeaway
 => #<Takeaway:0x007f8fe2bbfe80 @menu=#<Menu:0x007f8fe2bdcb98 @items={"Pepperoni"=>1, "Hot Shot"=>1, "Jardin"=>2, "Provencale"=>2, "Roquefort"=>3, "Neptune"=>3, "Poulet"=>4, "Four Seasons"=>4}>, @restaurant=#<Restaurant:0x007f8fe2bce138 @messenger=#<Messenger:0x007f8fe2be7ea8>, @menu=#<Menu:0x007f8fe2bdcb98 @items={"Pepperoni"=>1, "Hot Shot"=>1, "Jardin"=>2, "Provencale"=>2, "Roquefort"=>3, "Neptune"=>3, "Poulet"=>4, "Four Seasons"=>4}>, @header={:from=>"+441290211165", :to=>"+447527994300"}>, @basket={}>
2.2.3 :009 > takeaway.menu
Pepperoni  £1
Hot Shot  £1
Jardin  £2
Provencale  £2
Roquefort  £3
Neptune  £3
Poulet  £4
Four Seasons  £4
#<Menu:0x007f8fe2bdcb98>
 => nil
2.2.3 :010 > takeaway.add('Neptune')
 => 1
2.2.3 :011 > takeaway.summary
Neptune x1 = £3
 => nil
2.2.3 :012 > takeaway.total
Total: £3
 => nil
2.2.3 :013 > restaurant.order_takeaway
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC89d950d129482b828259244e80366b30/Messages/SM802bcf5621444d2f8d36b9623ec4a1f6>
 ```

Takeaway Challenge
==================

Instructions
-------
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (if you haven't already)
* Fork this repo
* run the command 'bundle' in the project directory to ensure you have all the gems
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

* Hints on functionality to implement:
  * ensure you have a list of dishes with prices
  * place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use a Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


**Note: We are looking for good OO design and programming! Remember the Single Responsibility and Dependency Injection/Inversion principles!**

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
