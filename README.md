Takeaway Challenge  <a href='https://coveralls.io/github/ayanit1/takeaway-challenge?branch=master'><img src='https://coveralls.io/repos/github/ayanit1/takeaway-challenge/badge.svg?branch=master' alt='Coverage Status' /></a> <a href="https://travis-ci.org/ayanit1/airport_challenge"><img src="https://travis-ci.org/ayanit1/airport_challenge.svg?branch=master"></a>
==================

Synopsis
========
For our weekend challenge at Makers Academy we were asked to create a program model based around a takeaway. As guideline we were given a set of user stories to complete the challenge.

User Stories
============
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

My Approach
===========
I first began reading all the material given to me and set up my workstation, meaning setting up files/folders and gems(particularly Travis CI and Coveralls, enabling them to be activated and looking at this particular build). Based on the user stories I then began to just draw a mock domain model to see potentially what classes could potentially be involved. Then after I focussed on the user stories one by one and created the program in a test development way.

Struggles faced
===============
- Dependancy injection. Getting my feature test to work
- Doing things in a TDD way
- Getting my build to pass Travis CI
- Writing tests for the message class


Progression / Things I would want to improve
============================================
- Use symbols for dishes or have a key to refer to
- Dislike returning strings
- Make the Menu more easy to edit i.e. delete items, change price etc
- Possible implementation for the use of CSV files to have different sets of menus
- Create a customer database for all customers
- Guard conditions and extreme values
- Better tests

Usage
==========
- run in irb

```
2.3.1 :001 > require './lib/takeaway'
 => true
2.3.1 :002 > menu = Menu.new
 => #<Menu:0x007ff851bda2d0 @dishes=[]>
2.3.1 :003 > takeaway = Takeaway.new(menu)
 => #<Takeaway:0x007ff851bc8e40 @menu=#<Menu:0x007ff851bda2d0 @dishes=[]>, @basket=[], @send_message=#<Message:0x007ff851bc8e18 @accountSID="ACd46c2d4277327ad9014d8e9b3a16a9b9", @authToken="5a9ab4edfcba1c5f111a502df2312228", @client=<Twilio::REST::Client @account_sid=ACd46c2d4277327ad9014d8e9b3a16a9b9>, @from="+441315103569", @customer={"+447595939340"=>"Albert Yanit"}>>
2.3.1 :004 > menu.add_dish("Burger Meal", 7)
 => [{"Burger Meal"=>7}]
2.3.1 :005 > menu.add_dish("Lobster Meal", 10)
 => [{"Burger Meal"=>7}, {"Lobster Meal"=>10}]
2.3.1 :006 > takeaway.print_menu
 => "Burger Meal: £7,Lobster Meal: £10"
2.3.1 :007 > takeaway.add_to_basket("Lobster Meal", 2)
Lobster Meal x 2 costs £20 => [["Lobster Meal", 2, 20]]
2.3.1 :008 > takeaway.confirm_meal
Confirmed order: 2x Lobster Meal, Total cost: £20 Sent message to Albert Yanit
 => {"+44**********"=>"Albert Yanit"}
 ```
Running tests
=============
- Use ```rspec``` in parent directory

Author
====================
Albert Yanit
