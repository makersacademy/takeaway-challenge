I'm very sorry to say that I tried to do my work this weekend on my laptop at home, and that I had serious problems with ruby version conflicts, stopping me from getting the twilio gem to work at all.

Similarly, rspec wouldn't work, failing in a way that made no sense to me, so I tried to do what I could without it, and even that lead to problems that made me feel like I haven't learnt anything (eg I couldn't even initialize a class in irb).  All of this triggered a minor depressive episode and I decided to stop working before it got worse, try and get a good night's sleep and approach the next week's learning as positively as I can.  I'm very disappointed in myself and hope I can get past this, and apologise for my failure, and hope I've learnt at least not to bother trying to use my own laptop for work in future.

Chris






Takeaway Challenge
==================

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices


just need a menu hash of names => prices
menu class?





As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes


needs an order class that creates a new hash by selecting from the menu hash







As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

write a method in order that creates an itemised bill from your order




As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


get twilio to work. work out how to get the current time and modify it to be an hour in the future.










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
