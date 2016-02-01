Takeaway Challenge
==================
Author: Arnold Manzano (arnoldmanzano)

[![Build Status](https://travis-ci.org/arnoldmanzano/takeaway-challenge.svg?branch=master)](https://travis-ci.org/arnoldmanzano/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/arnoldmanzano/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/arnoldmanzano/takeaway-challenge?branch=master)

#### Installation Instructions and Notes
* After forking the repo, run ``` bundle install ``` to install gem dependencies.
* twilio-ruby gem is used for text messaging capabilities, an account is required.
* dotenv-rails gem is used to store sensitive information in environment variables. A sample is available in file ```.env.example```.
* ```docs/dish_list.txt``` file contains dish list and price and is loaded on program start.

#### IRB sample tests


```sh
2.2.3 :001 > require './lib/takeaway'
 => true
2.2.3 :002 > t1 = Takeaway.new
 => #<Takeaway:0x007fec34368df0 @basket={}, @menu=#<Menu:0x007fec34368dc8 @dish_list={"cheeseburger"=>3.5, "wings"=>2.5, "fries"=>1.5, "soda"=>0.5, "juice"=>0.5}>, @sms_handler=#<SmsHandler:0x007fec34363508>>
2.2.3 :003 > t1.show_menu
 => {"cheeseburger"=>3.5, "wings"=>2.5, "fries"=>1.5, "soda"=>0.5, "juice"=>0.5}
2.2.3 :004 > t1.order('cheeseburger')
 => [1, 3.5]
2.2.3 :005 > t1.order('wings', 2)
 => [2, 5.0]
2.2.3 :006 > t1.order('soda')
 => [1, 0.5]
2.2.3 :007 > t1.order('soda')
 => [2, 1.0]
2.2.3 :008 > t1.basket
 => {"cheeseburger"=>[1, 3.5], "wings"=>[2, 5.0], "soda"=>[2, 1.0]}
2.2.3 :009 > t1.bill
 => 9.5
2.2.3 :010 > t1.checkout(9.5)
 => <Twilio::REST::Message @path=/2010-04-01/Accounts/AC6b5e7fb9d14c01ba6507be6c4f455faf/Messages/SM59dcce36bd1d4ae8830a08ee361d038a>
```
Design Approach
-------

* Menu class handles responsibilities relating to menu:
	* loading list of dishes from a file
	* hash containing dish_list
	* reporting back on the price, as well as a guard clause if item does not exist on menu


* SmsHandler class takes care of message sending responsibilities:
	* creating twilio api client and loading tokens and numbers from environment variables
	* composing the message with time and amount
	* sending the sms

* Takeaway class is the main class that is responsible for the takeaway order. It communicates with the other classes as necessary and has the following responsibilities:
	* handles the order and adding items to basket
	* calculates bill and checkout
	* communicates with Menu for menu-related queries like list of dishes and price
	* communicates with SmsHandler when checkout is complete
	* basket hash key is the dish, basket hash value is an array containing quantity and subtotal so user can see running subtotal per item ordered

 
* Other notes:
	* Dependency injection is used to inject Menu and SmsHandler class into Takeaway class
	* Menu and SmsHandler does not communicate with each other at all, only to Takeaway
	* Rspec unit tests use doubles and stubbing to isolate test for individual classes
	* SmsHandler tests stub the twilio gem so no actual sms is sent during rspec testing

User stories implemented:
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



Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_november2015 (if you haven't already)
* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:


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