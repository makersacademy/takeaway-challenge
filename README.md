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

my test
```Jamies-MacBook-Pro:takeaway-challenge jamierose$ irb
2.2.3 :001 > require './lib/take_away'
 => true
2.2.3 :002 > t = Takeaway.new
 => #<Takeaway:0x007fdee2867068 @my_order={}, @total=0.0>
2.2.3 :003 > t.order('Fries')
 => 1
2.2.3 :004 > t.order('Fries')
 => 2
2.2.3 :005 > t.order('Fries')
 => 3
2.2.3 :006 > t.calculate
 => 2.67
2.2.3 :007 > t.check_out
NoMethodError: private method `check_out' called for #<Takeaway:0x007fdee2867068 @my_order={"Fries"=>3}, @total=2.67>
	from (irb):7
	from /Users/jamierose/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :008 > ```
you can add as manny items as you like and it will still calculate them.
they only thinng i didnt do was the API.
i started but ran out of time.

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
