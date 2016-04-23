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
This is the attempt made to resolve this exercise.  Object modelling was the first challenge to resolve, and it was a critical one to ensure a good implementation adhering to all the relevant best practices and SOLID principles. It was decided to use the following model:

##Classes:

###Menu:  Class that manages storing the menu and accessing to its information

* Attributes: 
	- dishes (reader).  dishes is a hash to keep track of all the dishes and its prices.  Default value is “dish not found”  
* Methods:
	- price(dish) : Returns a Fixnum object. Gets in the hash the value containing the price of a dish, or the default value if not found.  
	- contains?:(dish) Returns a Boolean object.  Checks if the dish exists in the hash dishes
* Class interaction: Menu needs to be injected into class Order to ensure orders can be passed using the available dishes.

###TakeAway : Class that receives orders when they are complete, and send texts to customers
* Attributes: 
	- Time ( Time.now() )
* Methods:
	- send_text(customer_phone): Returns..? Send texts to customers using details from order
* Class interation: Order needs to be injected into TakeAway

###Order : Class that manages customers orders.  It is probably the model core.
* Attributes: 
	- basket (accessor) non-completed orders status capture in basket
* Methods:
	- add(*args): adds a dish to the basket, taking into account quantities and the logic of how customer can ask for dishes. Sets complete? if the entry is of the type qty dish amount as per instructions
	- total : Returns a Fixnum object. Traverses the current baskets and calculate the current sum
	- basket_summary: (no args) Provides a summary of the dishes currently in basket, quantity, dishes and cost per group of dishes, e.g. "jamon serrano x4 = £63.96, croquetas gato x3 = £23.97"
	-checkout: (no args) Requests to complete the order and send it for processing. Check for edge cases if zero items in basket and request to checkout. Calls Takeaway send_text if order ok. Clears current basket. Return not needed?
* Class interaction: Order is the kernel of the model. It takes a Customer object to get customer details (phone number), a Menu object to get access to dishes and prices, and a Takeaway object to ensure it can call the relevant method in the Takeway to send the text. 

###Customer: Small class that stores customer name and telephone number.  Probably not required at this stage but for future scalability 
* Attributes: :name, :phone (reader)
* Methods : none (apart from the attributes automatically generated)


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
