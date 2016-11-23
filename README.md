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

A program that allows customers to place food orders. Upon checkout, they will receive a text confirmation with the time of their order (an hour in the future).

# takeaway.rb

Contains the main body of the program, interacting with menu.rb, order.rb and sms.rb.

 #see_menu prints the menu from menu.rb to the screen for the customer.

 #add_to_basket(item) adds the selected menu item to the basket, with an optional quantity for multiple items.

 # show_basket returns the current basket.
 # show_price returns the total price of all items in the basket.

 #checkout(amount) confirms the order, as long as the amount matches the total price, preventing any calculation errors. It also sends a text message confirming the order to the customer's mobile number.

# menu.rb

Stores the restaurant's food items in a constant called MENU.

 #menu is used to access the menu in other files.

#order.rb

Stores the customer's order.

  #add_to_basket(item) adds an item to the basket. It will fail if an item is not on the menu.

  #checkout(total) confirms the order, failing if the total amount does not match the grand total.

  private methods are mainly responsible for calculating total prices and adding to the grand total.

#sms.rb

Contains the twilio API, allowing text messages to be sent to a customer.

Challenges:

The main challenge in this test was stubbing the twilio API, and I was unable to get this working properly (I had to use allow_all_instances_of SMS, as rspec was ignoring any doubles I created.)

Another big difficulty was ensuring 100% test coverage (which I was unable to do), particularly due to the sms.rb file. I feel this should be ignored during tests, as it is unnecessary to test every single one of its components.


User Stories
----

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
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

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
