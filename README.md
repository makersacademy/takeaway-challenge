About
=======

Organised into 3 classes:
* **Menu** contains dishes and prices and the functionality to view these in a list format.
* **Order** allows user to select the desired quantity of dishes by their number on the menu and add these to a basket. User can view what is in their basket, see the total price and checkout their basket.
* **TextProvider** holds functionality to send a text to the customer when their order is successfully placed using the Twilio API.

How to use
----------

```
$irb

2.5.0 :001 > require './lib/order.rb'
 => true

2.5.0 :002 > menu = Menu.new
 => #<Menu:0x00007fc2f9bf2ca0 @dishes=[{:dish=>"Egg fried rice", :price=>3}, {:dish=>"Sweet & sour fish", :price=>6}, {:dish=>"Morning glory", :price=>4}]>

2.5.0 :003 > menu.view
1. Egg fried rice: £3
2. Sweet & sour fish: £6
3. Morning glory: £4

2.5.0 :004 > order = Order.new
 => #<Order:0x00007fc2f85288d0 @basket=[]>

2.5.0 :005 > order.select_dish(1, 3)
3x Egg fried rice added to your basket
=> [{:dish=>"Egg fried rice", :total=>9}]

2.5.0 :006 > order.select_dish(3, 2)
2x Morning glory added to your basket
=> [{:dish=>"Egg fried rice", :total=>9}, {:dish=>"Morning glory", :total=>8}]

2.5.0 :007 > order.basket_summary
Egg fried rice, £9
Morning glory, £8
=> [{:dish=>"Egg fried rice", :total=>9}, {:dish=>"Morning glory", :total=>8}]

2.5.0 :008 > order.total
Your total bill is £17

2.5.0 :009 > order.checkout(17)
Your total bill is £17
 => <Twilio.Api.V2010.MessageInstance account_sid: ******* api_version: 2010-04-01 body: Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before 11:39 date_created: 2019-10-27 10:40:00 +0000 date_updated: 2019-10-27 10:40:00 +0000

```


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
