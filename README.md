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

Description
-----

This challenge creates a restaurant ordering platform.  The customer can see the menu, order whichever dishes she likes, check that the total is correct, and receive a confirmation text.  I first created a `Restaurant` class, which holds the functions of displaying the menu, ordering, returning the total price, and confirming the total price.  I then created a `Print` module, which contains the printing methods used to display the order.  Finally, I created a `Text` module to use Twilio to send a confirmation text to my own number.

I used `rspec` and `irb` to test these files.  When writing the rspec tests for Twilio, I first allowed the test to send me a text message, and then when I had confirmed that this was working, I stubbed it out so that the test would not issue a text.  However, `irb` will still allow the user to generate a text message.

Requirements
-----
Ruby 2.4.0

gem 'capybara'

gem 'rake'

gem 'rspec'

gem 'rubocop'

gem 'simplecov', require: false, group: :test

gem 'simplecov-console', require: false, group: :test

gem 'twilio-ruby'

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
