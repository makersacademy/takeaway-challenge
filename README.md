This is my submission for the Makers Academy week 2 weekend challenge.

For this application to work, it is very important that you add your twilio account SID and auth token to your env variables as TWILIO_ACCOUNT_SID and TWILIO_AUTH_TOKEN. You can find these details here: https://www.twilio.com/user/account. You will also need to add your mobile phone number as MY_MOBILE_NUMBER. For the tests to work, you will also need to add your test account SID and your test auth token as TEST_TWILIO_ACCOUNT_SID and TEST_TWILIO_AUTH_TOKEN. These can be found here: https://www.twilio.com/user/account/phone-numbers/dev-tools/test-credentials

Please run 'Bundle' from your command line to install all gems required.

This application is designed to model a takeaway ordering service. Below is an example of how to run the code from PRY.

[1] pry(main)> load './lib/takeaway.rb'
=> true
[2] pry(main)> takeaway = Takeaway.new
=> #<Takeaway:0x007ffb649a11d8 @menu={"starter"=>5, "mains"=>10, "desert"=>3}, @text=#<Text:0x007ffb649a1188>>
[3] pry(main)> takeaway.show_dishes
starter : 5
mains : 10
desert : 3
=> nil
[4] pry(main)> takeaway.order("starter", 2, "mains", 2, "desert", 1, 33)
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/ACaee8365e73fec8578fcc85122bac9918/Messages/SM149215a1506842b98ec63d6d3bdbb19d>


Takeaway Challenge
==================

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
