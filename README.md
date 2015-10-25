Takeaway Challenge
==================
The challenge is to build a Takeaway app that allows the customer to see a menu (dishes + price) from which she can order a number of items. The customer needs to be able to check the order (price of the dishes + total to pay). The customer will receive a text message indicating the time of delivery.

At a later point, the feature to order food by text can be implemented.

[Outline your approach](#my-approach)

[Used design patterns and principles](#design-principles-and-patterns)

[Further features/improvements to add](#further-improvements-to-add)

[How to use](#how-to-use)

[User Stories to Implement](#user-stories-to-implement)

[Additional Hints](#additional-hints)

My approach
-----------

After implementing all functionality in a single class following a rigorous red/green/refactor cycle, I extracted a Menu class. I thought of extracting an Order class as well, but that would basically leave Takeaway void of any functionality, so I decided against it.

Design principles and patterns
------------------------------

* Single Responsibility principle (and dependency injection)
* DRY

Further improvements to add
---------------------------

* Different national cuisines
* Order food via text
* Make selecting food from menu more intuitive

How to Use
----------

Pass the menu specific to your restaurant as an argument

`restaurant = Takeaway.new(FrenchCuisine)`

Show the menu:

`restaurant.show_menu`

Place an order:

`restaurant.order('Hamburger', 2)`

See the content of your shopping basket:

`restaurant.basket_content`

See the total to pay for your order:

`restaurant.total`

Reset the order:

`restaurant.reset`

When checking out, pass the price, so we know you agree to it:

`restaurant.checkout(3.99)`

You will receive a text message with confirmation of your order and estimated delivery time (ca. 1 hour).

User stories to implement
--------------------------

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

Additional Hints
-----------------
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

[![Build Status](https://travis-ci.org/samover/takeaway-challenge.svg)](https://travis-ci.org/samover/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
