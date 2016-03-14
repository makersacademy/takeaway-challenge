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
Author: Simon Glancy
date: 14/03/2015
Makers Weekend Challenge 2

Task
-----

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

Installation Instructions

* Fork this repo.
* Run the command bundle install in the root directory to install dependancies.
* The twilio-ruby gem is use for text messaging capabilities. An account is required, visit https://www.twilio.com/ to create a free one. A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number.
* The dotenv-rails gem is used to store sensitive information in environment variables. Create a .env file in the root directory to store the following variables : ACCOUNT_SID, AUTH_TOKEN, FROM_PHONE_NUMBER, TO_PHONE_NUMBER


Feature Spec examples
--------------------

describe 'Feature Spec' do
menu = Menu.new
my_order1 = MyOrder.new(menu)
my_order2 = MyOrder.new(menu)
my_order3 = MyOrder.new(menu)
my_order4 = MyOrder.new(menu)
my_order5 = MyOrder.new(menu)

before(:each) do

  menu.add_dish("Chicken Curry", 12.30)
  menu.add_dish("Fish Curry", 11.30)
  menu.add_dish("Lamb Curry", 13.30)
  menu.add_dish("Fries", 2.30)
  menu.add_dish("Salad", 7.30)
  menu.add_dish("Naan", 3.30)
  menu.add_dish("Pilau Rice", 1.30)
  menu.add_dish("Plain Rice", 0.30)
  menu.add_dish("Poppadom", 0.30)


end

  it 'USER STORY 1 - see a list of dishes with prices' do
    my_order1.pick("Chicken Curry", 4)
    expect(my_order1.menu.show_menu).to be_a String
  end

  it 'USER STORY 2.1 - select some number of several available dishes (Quant)' do
    my_order2.pick("Chicken Curry", 4)
    expect(my_order2.picks[0][1]).to eq 4
  end

  it 'USER STORY 2.2 - select some number of several available dishes (Name)' do
    my_order3.pick("Chicken Curry", 4)
    expect(my_order3.picks[0][0].name).to eq "Chicken Curry"
  end

  it 'USER STORY 3.1 - check total' do
    my_order4.pick("Chicken Curry", 4)
    expect(my_order4.total).to eq 49.20
  end

  it 'USER STORY 3.2 - shows full receipt at checkout' do
    my_order5.pick("Chicken Curry", 4)
    expect(my_order5.check_out).to be_a String
  end

end



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
