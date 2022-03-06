# Takeaway Challenge
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

## Description
-------

Our weekend challenge for week 2 of the Makers Academy coding boot camp in London was to build a basic food delivery program using the Twilio API to send delivery confirmation texts.

## Instructions for use
-------

1. This program can be run from the Terminal/Command Line using IRB
2. It requires Ruby 3.0.2, which can be installed with the following command:

```
rvm install 'ruby-3.0.2'
```

3. It also uses the Twilio API for sending SMS messages

```
gem install twilio-ruby
```

## User Stories
-------

The following user stories were supplied:

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## My Approach
-------

To start with, I created a menu_spec and test drove the functionality for browsing a menu as per the first user story:

```
jonnyabrams@JONNYs-MacBook-Pro takeaway-challenge % irb -r './lib/menu'
3.0.2 :001 > menu = Menu.new
 => 
#<Menu:0x0000000142857058
... 
3.0.2 :002 > menu.browse
bolognese: 7.5
carbonara: 6.5
puttanesca: 5.5
arrabiata: 4.5
 => {"bolognese"=>7.5, "carbonara"=>6.5, "puttanesca"=>5.5, "arrabiata"=>4.5} 
```

Then I test-drove an Order class as my primary interface, initializing it at first with an empty array as a basket to add orders to. I later changed this to a hash to facilitate my remove_dish method, which was growing cumbersome with the array.

Following the second user story, I gave my select_dish method two parameters: one for the dish itself, one for the quantity:

```
jonnyabrams@JONNYs-MacBook-Pro takeaway-challenge % irb -r './lib/order'
3.0.2 :001 > order = Order.new
 => 
#<Order:0x00000001563709b8
... 
3.0.2 :002 > order.select_dish('bolognese', 2)
 => 2 
3.0.2 :003 > order.select_dish('puttanesca')
 => 1 
3.0.2 :004 > order.basket
 => [["bolognese", 7.5], ["bolognese", 7.5], ["puttanesca", 5.5]] 
```

The third user story was as simple as creating the private method calculate_total:

```
jonnyabrams@JONNYs-MacBook-Pro takeaway-challenge % irb -r './lib/order'
3.0.2 :001 > order = Order.new
 => 
#<Order:0x000000013a0f01f0
... 
jonnyabrams@JONNYs-MacBook-Pro takeaway-challenge % irb -r './lib/order'
3.0.2 :001 > order = Order.new
 => 
#<Order:0x000000013f84fe78
... 
3.0.2 :002 > order.select_dish('carbonara')
 => 1 
3.0.2 :003 > order.select_dish('arrabiata', 3)
 => 3 
3.0.2 :004 > order.remove_dish('carbonara')
 => 1 
3.0.2 :005 > order.remove_dish('arrabiata', 2)
 => 2 
3.0.2 :006 > order.select_dish('bolognese')
 => 1 
3.0.2 :007 > order.basket
 => {"carbonara"=>0.0, "arrabiata"=>4.5, "bolognese"=>7.5} 
3.0.2 :008 > order.calculate_total
 => 12.0 
```

I also added a 'fail' guard clause in case of unavailable dishes:

```
jonnyabrams@JONNYs-MacBook-Pro takeaway-challenge % irb -r './lib/order'
3.0.2 :001 > order = Order.new
 => 
#<Order:0x0000000149a940d0
... 
3.0.2 :002 > order.select_dish('gnocchi')
/Users/jonnyabrams/Projects/Makers/takeaway/takeaway-challenge/lib/order.rb:14:in `select_dish': This is not on the menu (RuntimeError)
        from (irb):2:in `<main>'
        from /Users/jonnyabrams/.rvm/rubies/ruby-3.0.2/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
        from /Users/jonnyabrams/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `load'
        from /Users/jonnyabrams/.rvm/rubies/ruby-3.0.2/bin/irb:23:in `<main>'
```

Then it was time to implement a checkout method sending a confirmation text via the Twilio API:

```
jonnyabrams@JONNYs-MacBook-Pro takeaway-challenge % irb -r './lib/order'
3.0.2 :001 > order = Order.new
 => 
#<Order:0x00000001450f58c0
... 
3.0.2 :002 > order.select_dish('carbonara', 3)
 => 3 
3.0.2 :003 > order.select_dish('bolognese')
 => 1 
3.0.2 :004 > order.select_dish('puttanesca', 2)
 => 2 
3.0.2 :005 > order.checkout
carbonara: 19.5
bolognese: 7.5
puttanesca: 11.0
*************
Your total is 38.0
 => <Twilio.Api.V2010.MessageInstance body: Sent from your Twilio trial account - Thank you! Your order was placed and will arrive by 11:50 num_segments: 1 direction: outbound-api from: +16626678674 to: +447867513304 date_updated: 2022-03-06 10:51:00 +0000 price:  error_message:  uri: /2010-04-01/Accounts/ACadafd609098a3ba714c6f6e1917a6ce4/Messages/SM3bd3c82ea0f54256898ed9e9b6e47948.json account_sid: ACadafd609098a3ba714c6f6e1917a6ce4 num_media: 0 status: queued messaging_service_sid:  sid: SM3bd3c82ea0f54256898ed9e9b6e47948 date_sent:  date_created: 2022-03-06 10:51:00 +0000 error_code:  price_unit: USD api_version: 2010-04-01 subresource_uris: {"media"=>"/2010-04-01/Accounts/ACadafd609098a3ba714c6f6e1917a6ce4/Messages/SM3bd3c82ea0f54256898ed9e9b6e47948/Media.json"}> 
```

![image](files/Users/jonnyabrams/Desktop/twilio-conf.jpeg)

## Improvements Needed
-------

With a basket in the form of a hash, the bill cannot separate multiple orders of the same dish (although it does charge the correct amount).

By [Jonny Abrams](https://github.com/jonnyabrams)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)





* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
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

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * The text should state that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) when you run your tests.
