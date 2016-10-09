
[![Coverage Status](https://coveralls.io/repos/github/kathwath/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/kathwath/takeaway-challenge?branch=master)

Takeaway Challenge - Week 2
==================


Setup environment
-------

Git clone - https://github.com/kathwath/takeaway-challenge.git

Gemfile contains:
ruby '2.3.1'

gem 'twilio-ruby'
gem 'rake'
gem 'rspec'
gem 'coveralls', require: false
gem 'capybara'

Use 'bundle' to install all required gems for this program.

Instructions
-------

Create a program based on a takeaway service, which allows customers to view the menu, order dishes etc.. The following are the user stories that form the basis of this program:

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

Additional Information
------

All rspec tests are passing, but I am not sure if the text message stubbing is working correctly.  It doesn't send a text whilst completing rspec and does send a text when testing in pry, but I will need to check this out.

I have activated travis-CI on my local repo and am also attempting to use Coveralls locally for the first time too.
