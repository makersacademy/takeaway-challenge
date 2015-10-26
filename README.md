[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)

*Takeawaaaaaaaay Challenge*
==================

## Instructions

```python
2.2.3 :001 > a = Takeaway.new
 => #<Takeaway:0x007ff33c...
2.2.3 :002 > a.menu
 => "This minutes menu, icecream :£5, dohnuts :£2, potatoes :£1"
2.2.3 :003 > a.add('potatoes')
 => "Current order: {:potatoes=>1}, Current total: 1"
2.2.3 :004 > a.add('potatoes', 300)
 => "Current order: {:potatoes=>301}, Current total: 301"
2.2.3 :005 > a.current_order
 => "Current order: {:potatoes=>301}, Current total: 301"
2.2.3 :006 > a.checkout
 => "ORDER PLACED: Final order: {:potatoes=>301}, Final total: 301"
2.2.3 :007 >

you i receive a text
```

### * TODO *
- txt 2 order
- pretty the interface
- editing of the menu


## Original Task
-----
User stories
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

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


**Note: We are looking for good OO design and programming! Remember the Single Responsibility and Dependency Injection/Inversion principles!**
