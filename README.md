Takeaway Challenge - WEEK 2
===========================
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

PROJECT OVERVIEW
----------------
* a program that allows users to create their own menu, show that menu in a readable form, select a dish and add it to their order and finally confirm the order and send a confirmation text via twilio API
* list of classes: dish / menu / order / msg_sender

IRB EXAMPLE
-----------
```
2.4.0 :002 > require './lib/menu'
 => true
2.4.0 :003 > menu = Menu.new
 => #<Menu:0x007fbb1833ee58 @list_of_dishes=[], @new_order=[]>
2.4.0 :004 > menu.add_dish("Pizza", 5)
 => [#<Dish:0x007fbb18327460 @name="Pizza", @price=5>]
2.4.0 :005 > menu.add_dish("Fries", 6)
 => [#<Dish:0x007fbb18327460 @name="Pizza", @price=5>, #<Dish:0x007fbb183155f8 @name="Fries", @price=6>]
2.4.0 :006 > menu.show_menu
 => "1. Pizza, £5\n2. Fries, £6"
2.4.0 :007 > menu.add_to_order(1,2)
 => [{:dish=>"Pizza", :quantity=>2, :price=>10}]
2.4.0 :008 > menu.add_to_order(2,2)
 => [{:dish=>"Pizza", :quantity=>2, :price=>10}, {:dish=>"Fries", :quantity=>2, :price=>12}]
2.4.0 :009 > order = menu.place_order
 => #<Order:0x007fbb182dee40 @current_order=[{:dish=>"Pizza", :quantity=>2, :price=>10}, {:dish=>"Fries", :quantity=>2, :price=>12}]>
2.4.0 :010 > order.process_order
 => #<MsgSender:0x007fbb182cf800>
 ```

INSTALLATION INSTRUCTIONS
-------------------------
* please run `bundle install` when running this for the first time
* twilio-ruby and sinatra gems are required for correct sms functionality
* rspec needs to be working for correct test functionality

SOURCE
------
Original of the challenge can be found here: https://github.com/makersacademy/takeaway-challenge



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
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
