Matt Thompson - Takeaway Challenge
==================================

## Description

This Ruby application allows users to browse a menu, select dishes, place an order and receive a text message to confirm their order delivery time.


#### Technologies used

- Ruby
- RSpec
- Twilio


#### Personal motivation

- Encapsulation and delegation between classes
- Using test doubles and dependency injection to isolate classes in tests
- Testing behaviour over state


## Steps to download

1. Fork this [repo](https://github.com/mattTea/takeaway-challenge)

2. `git clone git@github.com:<userName>/takeaway-challenge.git` onto your local machine


## Steps to run

#### To set up base objects and data

Run `irb -r ./lib/menu.rb` in root project directory

```ruby
2.5.0 :001 > m = Menu.new
 => #<Menu:0x00007fb6d5848148 @dishes=[]> 
2.5.0 :002 > m.add_dish("burger", 10)
 => [#<Dish:0x00007fb6d4961c88 @name="burger", @price=10>] 
2.5.0 :003 > m.add_dish("chips", 5)
 => [#<Dish:0x00007fb6d4961c88 @name="burger", @price=10>, #<Dish:0x00007fb6d49506e0 @name="chips", @price=5>] 
2.5.0 :004 > m
 => #<Menu:0x00007fb6d5848148 @dishes=[#<Dish:0x00007fb6d4961c88 @name="burger", @price=10>, #<Dish:0x00007fb6d49506e0 @name="chips", @price=5>]> 
2.5.0 :005 > m.view_dishes
 => [#<Dish:0x00007fb6d4961c88 @name="burger", @price=10>, #<Dish:0x00007fb6d49506e0 @name="chips", @price=5>] 
```

#### To run example methods

`select` dish to add to order
```ruby
2.5.0 :001 > m.select_dish(m.dishes[0])
 => #<Order:0x00007f8d798f62a0 @selected_dishes=[#<Dish:0x00007f8d799068d0 @name="burger", @price=10>], @confirmed=false, 
```

`view_total` cost of order
```ruby
2.5.0 :001 > m.orders[0].view_total
 => 10
```

`confirm_order`
```ruby
2.5.0 :001 > m.orders[0].confirm_order
 => <Twilio.Api.V2010.MessageInstance account_sid: **** api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 14:59 date_created: 2019-03-17 13:59:10 +0000 date_updated: 2019-03-17 13:59:10 +0000 date_sent:  direction: outbound-api error_code: 0 error_message:  from: **** messaging_service_sid:  num_media: 0 num_segments: 1 price: 0.0 price_unit: USD sid: **** status: queued subresource_uris: {"media"=>"/2010-04-01/Accounts/****/Media.json"} to: **** uri: /2010-04-01/Accounts/****.json>
```
`orders` to view list of orders
```ruby
2.5.0 :001 > m.orders[0]
 => #<Order:0x00007f817a9062a0 @selected_dishes=[#<Dish:0x00007f817a9168a8 @name="burger", @price=10>, #<Dish:0x00007f817a90e630 @name="chips", @price=5>, #<Dish:0x00007f817a90e630 @name="chips", @price=5>], @confirmed=true, @total=20> 
```


## To run tests

Run `rspec` directly in root of your local project


## My approach

1. Break down user stories into an [object model](https://github.com/mattTea/takeaway-challenge/blob/master/problem/user_stories.md)

2. Create initial view of [class model](https://github.com/mattTea/takeaway-challenge/blob/master/problem/takeaway_class_diagram.jpg) and [sequence diagram](https://github.com/mattTea/takeaway-challenge/blob/master/problem/takeaway_sequence_diagram.jpg)

3. Test drive design of first `Class` and `methods`


------

------



Original Readme - Takeaway Challenge
====================================
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

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
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
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

* **WARNING** think twice before you push your mobile number or any private details to a public space like Github. Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
