-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Takeaway Challenge
==================

TakeAway was Designed to run with Ruby 2.2.3 

The target of this program is given a menu of dishes, you can see them, choose them, check the order broken down, the bill and even place the order to be received within 18 minutes and 52 seconds!

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Run the program
==================

| => irb                                   <------------ `open irb`
2.2.3 :001 > `require './lib/select.rb'`   <------------ `require!`
=> true 
2.2.3 :002 > `menu = Select.new`           <----------- `create an instance!`
=> #<Select:0x007fed72885628 @menu={"Burger"=>10, "Pint"=>4.5, "Steak"=>18, "Wine"=>22, "Chips"=>3.25}, @order={}, @total=[], @due=0> 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Once to have run the program you can use the next commands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Use `.see` to check the whole menu
====================================

2.2.3 :003 > `menu.see`                    <----------- `check the menu` 
=> {"Burger"=>10, "Pint"=>4.5, "Steak"=>18, "Wine"=>22, "Chips"=>3.25} 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use `.pick(your dish, number of dishes)` to choose a dish. If you are happy with only one portion do not worry about introducing number of dishes, the program will set it to 1 automaticly.
=======================================
2.2.3 :004 > `menu.pick('chips',4)`        <----------- choose your favorite dishes and pick them!
would you like something else?
 
2.2.3 :005 > `menu.pick('Steak',4)`        
would you like something else?
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Use `.order`to see your order and it's details.'
======================================================

2.2.3 :006 > `menu.order`                  <----------- `Check your order broken down to make sure it is right`
4 Chips-> 3.25£ each -> 13.0£
4 Steak-> 18£ each -> 72£
=> {"4 Chips"=>{"3.25£ each"=>"13.0£"}, "4 Steak"=>{"18£ each"=>"72£"}} 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Use `.bill` for check the list of items and the amount due, do not worry if you do not trust about the price, it will show you everything for you to check the IT IS RIGHT!
============================================================================================================================================================================
2.2.3 :007 > `menu.bill`                   <-----------  `check the amount due and the list broken down`
4 Chips-> 3.25£ each -> 13.0£
4 Steak-> 18£ each -> 72£
=> "Due 85.0£" 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Use `place_order`  for just get your food asap!
======================================================
2.2.3 :008 > `menu.place_order`            <---------`Place the order and get it within 18 minutes and 52 seconds`
4 Chips-> 3.25£ each -> 13.0£
4 Steak-> 18£ each -> 72£
=> `"Thank you! Your order will be delivered before 23:06"`

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
