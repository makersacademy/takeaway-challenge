Takeaway Challenge
==================

About
-------
* A weekend challenge to create an MVP for an interactive takeaway ordering system. It should confirm orders by SMS. It's UI is IRB.

How To Contribute
-------

Since this is a personal challenge to test my progress, I will not be accepting pull requests.

However you are most welcome to leave comments with any hints, feedback or advice!

How to Use
-------

Please download all files in lib, and require them in IRB. You can then use the classes to create new dishes, pass them to a restaurant. Create a customer, view the restaurants menu, and place an order.


User Stories & Brief Given
-------

```sh
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
  * The text sending functionality should be implemented using Twilio API.
  * Use a Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

**Criteria: We are looking for good OO design and programming! Remember the Single Responsibility and Dependency Injection/Inversion principles!**

Possible Future Additions
-------

In the future i may also extend this by adding additonal functionality such as:

  Extending MVP to add defaults when user fails to give (Eg: dish price, dish names, etc)

  Restaurants could view the recipe for each dish on their menu.


[![Build Status](https://travis-ci.org/DanBlakeman/takeaway-challenge.svg)](https://travis-ci.org/DanBlakeman/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/DanBlakeman/takeaway-challenge/badge.svg)](https://coveralls.io/r/DanBlakeman/takeaway-challenge)
