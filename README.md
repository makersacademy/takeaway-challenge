[![Build Status](https://travis-ci.org/Benaud12/takeaway-challenge.svg?branch=master)](https://travis-ci.org/Benaud12/takeaway-challenge)  [![Coverage Status](https://coveralls.io/repos/Benaud12/takeaway-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/Benaud12/takeaway-challenge?branch=master)


Takeaway Challenge
=======================

## Synopsis

The task is to write a Takeaway program satisfying the following user stories:

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

* Functionality to implement:
  * Ensure you have a list of dishes with prices.
  * Place the order by selecting your dishes, their quantities and a number that should be the exact total. If the number does not match the total an error should be raised, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".

* Texting:
  * The text sending functionality should be implemented using [Twilio API](https://www.twilio.com/api). You'll therefore need to register for a free account.
  * Use the [twilio-ruby gem](https://github.com/twilio/twilio-ruby) to access the API.
  * Use a Gemfile to manage your gems.
  * Make sure that your Takeaway program is thoroughly tested and that you use mocks and/or stubs, as necessary so as not to send texts when your tests are run.
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent.

* Extended feature:
  * Implement the ability to place orders via text message.


## To run this version

This is designed to run in the command line.

- Fork this repository and clone it to your local machine
- Run `gem install bundle` in the command line
- Once complete, run `bundle` to install the relevant gems
- Add a `.env` file to the root directory and add details of your phone number and Twilio account, as shwon below (if you don't have a Twilio account it just means you won't receive a text)
```
# .env file

ACCOUNT_SID= 'xxxxxxxxxxxxxxx'
AUTH_TOKEN= 'xxxxxxxxxxxxxx'
MY_PHONE_NUMBER= '123456789'
TWIL_PHONE_NUMBER= '987654321'
```
- You may then order your favourite meals to your heart's content, as per the example below...

```
$ irb
2.2.3 :001 > mickys = Restaurant.new
 => #<Restaurant:0x007fc37127eed0 @menu=[]>
2.2.3 :002 > mickys.make_dish_available(Dish.new('burger', 5.99))
 => [#<Dish:0x007fc3712be5f8 @name="Burger", @price=5.99>]
2.2.3 :003 > mickys.make_dish_available(Dish.new('chips', 0.99))
 => [#<Dish:0x007fc3712be5f8 @name="Burger", @price=5.99>, #<Dish:0x007fc3712dfc08 @name="Chips", @price=0.99>]
2.2.3 :004 > my_order = Order.new
 => #<Order:0x007fc371306560 @basket={}, @texting_service=TextingTwilio>
2.2.3 :005 > puts mickys.view_menu
1: Burger | Price: £5.99
2: Chips | Price: £0.99
 => nil
2.2.3 :006 > my_order.add_to_basket(mickys, 1, 3)
 => 3
2.2.3 :007 > my_order.add_to_basket(mickys, 2, 1)
 => 1
2.2.3 :008 > puts my_order.summary
3x Burger | £17.97
1x Chips | £0.99
Total cost: £18.96
 => nil
2.2.3 :009 > my_order.submit(18.96)
 => <Twilio::REST::Message ...
```


## Technologies Used

- Ruby, 2.2.3
- RSpec
- Twilio Texting API
- [dotenv](https://github.com/bkeepers/dotenv)
- [vcr](https://github.com/vcr/vcr) and [webmock](https://github.com/bblimke/webmock) gems used for testing the Twilio API response, some useful links below for guidance on using the vcr gem:
  http://www.relishapp.com/vcr/vcr/docs
  http://natashatherobot.com/vcr-gem-rails-rspec/


## Job List

- Using Ruby and testing in RSpec, test drive the creation of a set of classes/modules to satisfy the above user stories
- Implementing the [SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) principles of object-oriented design


## Still to complete/refactor

- [Implement extended feature]
