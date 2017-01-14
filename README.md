# Takeaway Challenge
### [Makers Academy] (http://www.makersacademy.com) - Week 2 Solo Weekend Project
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
## Index
* [Gems Used] (#GEMS)
* [Installtion] (#Install)
* [User Stories] (#US)
* [Usage] (#Usage)
 
## <a name="GEMS">Gems Used</a>
```ruby
gem 'rake'
gem 'rspec'
gem 'coveralls', require: false
gem 'capybara'
gem 'twilio-ruby'
```

## <a name="Install">Installation</a>
The Takeaway Challenge is ran on Ruby version : 2.3.1

* To change Ruby versions
```shell
$ rvm 2.3.1
```
* To install Ruby 2.3.1
```shell
$ rvm install ruby-2.3.1
```
* To install Gems
```shell
$ gem install bundle
$ bundle
```

## <a name="US">User Stories</a>
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

## <a name="Usage">Usage</a>

[![Build Status](https://travis-ci.org/adrianeyre/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/adrianeyre/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
