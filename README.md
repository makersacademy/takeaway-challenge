[![Build Status](https://travis-ci.org/andygout/takeaway-challenge.png)](https://travis-ci.org/andygout/takeaway-challenge)

[![Coverage Status](https://coveralls.io/repos/andygout/takeaway-challenge/badge.png)](https://coveralls.io/r/andygout/takeaway-challenge)

Takeaway Challenge
==================

Notes
-----
* I would have liked a feature whereby dishes could be removed from the order, but time was against me and given it was not part of the brief I decided not to include.
* I also would have liked to have tried to include the cost of the order in the text being sent out, but this required a variable from the checkout class to be passed into the twilio file being required, which would have required some further investigation to try and get working.
* I passed the order across to the checkout so that I could play with some dependency injection.
* Till was used as a module rather than a class given order and checkout are not types of till, but I needed the function of a till to be used for both order and checkout, so seemed like the best option.
* Not sure how effective my tests are in checkout_spec, as they are not categorically testing if a message would be sent.  Again time was against me but I would have liked longer to figure out a way in which this could have been tested wth more certainty (but without sending an actual text).  My final Coveralls test is suggesting I did not test the line where the twilio.rb file is included, so I'd like to learn how test in RSpec if the file exists/can be included but without actually running it.
* Still don't quite understand what Travis CI and Coveralls are specifically looking for or how to interpret the errors they flag up, especially they are given after the RSpec tests have passed.  Current updates passes these tests but I am not really sure how I got there.

User Stories
-----

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
  * ensure you have a list of dishes with prices
  * place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use a Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


**Note: We are looking for good OO design and programming! Remember the Single Responsibility and Dependency Injection/Inversion principles!**
