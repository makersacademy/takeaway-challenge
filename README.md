[![Build
Status](https://travis-ci.org/travis-ci/travis-web.svg?branch=master)](https://travis-ci.org/travis-ci/travis-web)

## The Takeaway Challenge
- Task: Write a Takeaway program with the following user stories:
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

**To run program**
```
$ git clone https://github.com/BasileKoko/takeaway-challenge
$ cd takeaway-challenge
$ pry
pry(main)> require './lib/takeaway'
pry(main)> takeaway = TakeAway.new
pry(main)> takeaway.read_menu
pry(main)> takeaway.order("Curry", 2)
pry(main)> takeaway.order("Soup", 3)
pry(main)> takeaway.basket_summary
pry(main)> takeaway.total_price
pry(main)> takeaway.complete_order(57.46)

```
**To run Test**
```
$ rspec
```

**To test coverage**
```
$ coveralls report
```

**Gem used in this project:**
```ruby
gem 'rake'
gem 'rspec'
gem 'coveralls'
gem 'capybara'
gem 'twilio-ruby'
gem 'dotenv'
```
