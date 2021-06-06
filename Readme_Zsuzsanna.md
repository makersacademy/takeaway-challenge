This weekend’s challenge was creating a very basic app that functions as a like a takeaway restaurant. There is a menu, you place an order, you calculate the total price, and confirm the order with a text message.

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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * The text should state that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

 ## <a name="GEMS">Gems Used</a>
```ruby
gem 'rake'
gem 'rspec'
gem 'coveralls', require: false
gem 'capybara'
gem 'twilio-ruby'
gem 'dotenv', '~> 2.1', '>= 2.1.1'
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

I followed this video to solve this challange: https://www.youtube.com/watch?v=mgiJKdH9x8c

