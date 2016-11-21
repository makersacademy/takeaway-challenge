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

Brief
-------
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

Approach
-------
[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/github/makersacademy/takeaway-challenge/badge.svg)](https://coveralls.io/github/makersacademy/takeaway-challenge)

I created four classes to create my solution to this challenge:

* Dish: holds information about a particular dish (its name and its price)
* DishesList: holds a list of available dishes and their prices
* Order: manages order creation i.e. selecting items from a list of dishes, calculating total order cost, order completion
* Notification: on completion of an order, an SMS is sent containing details about the order

These objects were chosen to attempt to achieve maximum object encapsulation in the system; for example, notifications know nothing about lists of dishes.

A possible future extension of this project would be to refactor the order total into a separate class.

Testing Approach
-----
This project is tested in [RSpec](http://rspec.info/). Simply run `rspec` to see the test suite.

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request. Run `coveralls report` to see a test coverage report (at the time of writing, test coverage is 100%). Doubles have been extensively used to so that each class can be tested in isolation.

Each object spec is grouped by method; the methods shown in the test results are the public instance methods available for each object.

The project uses [VCR](https://github.com/vcr/vcr) to stub Twilio behaviour. When the project tests are first run, an SMS will be sent. On subsequent test runs, VCR will replay a copy of TWilio's behaviour from the first run and not send any SMSes. This can be confusing if you make changes to the way SMS sending is done in the application, as behaviour will appear to stay the same as before you made changes. Delete ./fixtures/vcr_cassettes/twilio.yml when you make a change to SMS sending behaviour.

The tests for Dishes and Orders use a helper methods to create the object being tested. This is to keep the details of the object under test in a single source of truth. A possible extension to this project would be to use helper methods to create all tested objects.

How to Install
-----
Clone this project to your local machine and, in the project directory, run `bundle install` to ensure you have the gems required to run the project.

Getting Started
-----
This project uses [Twilio](https://www.twilio.com/) to send SMS notifications. To use this project, you'll need a Twilio account with the ability to send SMSes.

Twilio account credentials are drawn in from your environment variables and loaded using the dotenv gem. You'll need to add the following to your `.env` file, which you should place in the root directory of this project and add to your `.gitignore`:

```
TWILIO_ACCOUNT_SID=<your account sid>
TWILIO_AUTH_TOKEN=<your account auth token>
TWILIO_PHONE=<your twilio sms sending number>
TWILIO_DESTINATION_PHONE=<the phone number you'd like to receive notifications on>
```

Then run `./lib/order.rb` to start using the app. An example of how to use the app follows:

```
green_curry = Dish.new("Green Curry", 5)
penang_curry = Dish.new("Penang Curry", 7)
dishes = DishesList.new
dishes.list << green_curry
dishes.list << penang_curry
order = Order.new(dishes)
order.show_available_dishes
order.add_to_current("Green Curry", 2)
order.add_to_current("Penang Curry", 1)
order.complete(Notification)
```

In the example above, we instantiated two Dish objects (a green curry which costs 5, and a penang curry which costs 7), and loaded them into a DishesList.

We then initialized an Order with the DishesList containing the two curries. Next, we looked through the dishes availble to us and decided we wanted to order 2 green curries and 1 penang curry. The last step was to complete the order, using dependency injection to trigger the creation of an SMS notification which would look like this:

> Thank you for your order!  
> You should receive it before &lt;current time plus one hour&gt;  
>  
> Here's what you'll get:  
>  
> 2x Green Curry @ £5  
> 1x Penang Curry @ 7  
>    
> TOTAL: £17
