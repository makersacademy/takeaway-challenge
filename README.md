[![Coverage Status](https://coveralls.io/repos/github/awye765/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/awye765/takeaway-challenge?branch=master) [![Build Status](https://travis-ci.org/awye765/takeaway-challenge.svg?branch=master)](https://travis-ci.org/awye765/takeaway-challenge)

<h2>Takeaway Challenge: Makers Academy Week 2 Solo Project</h2>

<p align="center">
  <img src="http://hungryhouse.co.uk/wp-content/uploads/2013/12/order-takeaway-christmas-day-620x350.jpg">
</p>

<h2>Project Aim</h2>

To create a basic application in Ruby that fulfils the following user stories:

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

<h2>Project Functionality</h2>
* A list of dishes with prices that can be viewed on demand by a customer.
* Customer can place order by providing a list of dishes and their desired quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
* The text sending functionality has been implemented using Twilio API and twilio-ruby gem to access the API.
* Thorough unit testing with RSpec and the following RSpec functionality: lets helpers, doubles, mocks, method stubs, spies

<h2>Tech Stack</h2>
* Ruby
* IRB & PRY
* RSpec
* Atom
* Twilio API & twilio-ruby gem

<h2>Instructions</h2>

[To be updated immediately prior to project completion]
