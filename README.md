# Takeaway Challenge

[![Build Status](https://travis-ci.org/treborb/takeaway-challenge.svg?branch=master)](https://travis-ci.org/treborb/takeaway-challenge)
[![codecov](https://codecov.io/gh/treborb/takeaway-challenge/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/takeaway-challenge)

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
## [Makers Academy](http://www.makersacademy.com) - Week 2 - Solo Weekend Challenge

## Technologies
* [Ruby v2.3.3](https://www.ruby-lang.org/en/)
* [Rspec](http://rspec.info/)
* [Twilio (for SMS order confirmation)](https://www.twilio.com/)

## Jump To
* [User Stories](#user-stories)
* [Installation](#install)
* [Usage](#usage)
* [Tests](#tests)

## The Brief

Write a Takeaway program in Ruby, using the twilio-ruby gem for SMS order confirmation.

***Hints on functionality to implement:***

* Ensure you have a list of dishes with prices
* Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
* The text sending functionality should be implemented using Twilio API.
* Use the twilio-ruby gem to access the API
* Use the Gemfile to manage your gems
* Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
* However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

## <a name="user-stories">User Stories</a>

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

## <a name="install">Installation</a>
```
$ git clone https://github.com/treborb/takeaway-challenge.git
$ cd takeaway-challenge
$ rvm use 2.3.3 --install --binary --fuzzy
$ gem install bundler
$ bundle
```

## <a name="usage">Usage</a>

#### Load up your favourite REPL (e.g. irb)
```
$ irb
```

- Create an instance of the class Takeaway. The menu will be displayed when the instance is created.
- To view the menu manually, use the command .menu
- Order using .order(item_number, quantity, total_cost)
- Add additional items to the order with the same command
- View the basket using .basket
- Checkout and place the order using .checkout
- Enter your phone number at checkout to be sent the confirmation SMS message

#### In the REPL
```ruby
$ require './lib/takeaway.rb'
$ feedme = Takeaway.new
$ feedme.order(1, 3, 8.70)
$ feedme.order(2, 3, 11.70)
$ feedme.order(11, 1, 7.95)
$ feedme.order(17, 1, 8.95)
$ feedme.order(20, 2, 5.90)
$ feedme.basket
$ feedme.checkout
```

## <a name="tests">Running the tests</a>
```
$ rspec
```
