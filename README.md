Takeaway Challenge
==================
```
    Sergio Enrech Trillo    _________
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

Solution
-------
This is my attempt to resolve the challenge of this week. Full solution provided, (bonus not attempted)

## Installation
Clone the repo from GitHub, then run bundle on the root directory.
Ruby v. 2.2.3 used

```
$ bundle
```
Gems used: Gemfile listed below

```
gem 'rake'
gem 'rspec'
gem 'coveralls', require: false
gem 'capybara'
gem 'twilio-ruby'
gem 'dotenv'

```
Please note that my .env file has not been shared for security issues, if you want to check the send text functionality, please setup your own .env file within the root directory, as follows:

```
TWILIO_ACCOUNT_SID=<your twilio account SID>
TWILIO_AUTH_TOKEN=<your auth token>
TWILIO_SOURCE_PHONE=<Twilio phone number provided to you>
TWILIO_DESTINATION_PHONE=<Phone where you want to receive text msgs>
```
you can get a free trial account with Twilio on https://www.twilio.com/


## Classes:

The basic object modelling used is as follows:

Customer --> ContentManager --> Messager -->TakeAway <-- Order <-- Menu
                                          |
Order is the class at the core of the model where most of the logic is developed.

ContentManager manages the text of the message send to our customer, personalising name, and working the delivery time.  Text message sent for customer Sergio ordering at 13:25 is:

```
Hi Sergio, thank you for your order of 15.99€. Your food will be delivered before 14:25
```
Messager is the class that deals with sending the SMS using Twilio API

TakeAway processes the order and calls the Messager to send the text if the order is properly checked out

Order is the class managing the customer order.

Menu is the class that provides the list of dishes available and prices.

## Usage

```
2.2.3 :001 > c = Customer.new(name: "Sergio", phone: "")
 => #<Customer:0x0000000101fe68 @name="Sergio", @phone="">
2.2.3 :002 > cm = ContentManager.new(c)
 => #<ContentManager:0x00000000ff1888 @customer=#<Customer:0x0000000101fe68 @name="Sergio", @phone="">>
2.2.3 :003 > m = Messager.new(cm)
 => #<Messager:0x00000000fb8358 @content_manager=#<ContentManager:0x00000000ff1888 @customer=#<Customer:0x0000000101fe68 @name="Sergio", @phone="">>>
2.2.3 :004 > t = TakeAway.new(m)
 => #<TakeAway:0x00000000f86178 @messager=#<Messager:0x00000000fb8358 @content_manager=#<ContentManager:0x00000000ff1888 @customer=#<Customer:0x0000000101fe68 @name="Sergio", @phone="">>>, @menu=nil>
2.2.3 :005 > o = Order.new(t)
 => #<Order:0x00000000f81060 @menu=#<Menu:0x00000000f81038 @dishes={:"jamon serrano"=>15.99, :"croquetas gato"=>7.99, :"tortilla patata"=>4.99, :"spanish sangria"=>7.25}>, @takeaway=#<TakeAway:0x00000000f86178 @messager=#<Messager:0x00000000fb8358 @content_manager=#<ContentManager:0x00000000ff1888 @customer=#<Customer:0x0000000101fe68 @name="Sergio", @phone="">>>, @menu=nil>, @basket={}>
2.2.3 :006 > print o.menu
Bar El Gato Muerto
MENU
jamon serrano :   €15.99
croquetas gato :  €7.99
tortilla patata :   €4.99
spanish sangria :   €7.25
```
From here customer can provide a "quick checkout", ordering and item, its quantity, and providing the value of the total order.

```
2.2.3 :007 > o.add("jamon serrano", 1, 15.99)
"output is : Order confirmed, thank you! You will receive a text shortly..."
 => "1 x jamon serrano added to your basket.  Thank you! Your order has been processed. Confirmation SMS sent."
 ```
 And the basket should be empty at this stage:
 ```
2.2.3 :008 > o.basket_summary
 => "basket is empty"
2.2.3 :009 >
```

The other way of orderin is by adding items without providing the total amount of the order, i.e.
```
2.2.3 :009 > o.add("croquetas gato", 4)
 => "4 x croquetas gato added to your basket."
2.2.3 :010 > o.total
 => "Total: 31.96€"
2.2.3 :011 > o.add("spanish sangria",5)
"output is : "
 => "5 x spanish sangria added to your basket"
2.2.3 :012 > o.basket_summary
 => "croquetas gato x 4 = €31.96, spanish sangria x 5 = €36.25, "
2.2.3 :013 > o.total
 => "Total: 68.21€"
2.2.3 :014 > o.checkout(68.21)
 => "Order confirmed, thank you! You will receive a text shortly..."
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
