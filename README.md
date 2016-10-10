NOTES
TakeAway exist independantly of the menu that is used.
Takeaway instance requires a menu and so does Menu instance. 
A default csv menu file is loaded into the new Menu instance but this can be changed
or the new Menu instance can be instantiated with another csv menu file.
The menu displayed by a Menu instance or by the Takeaway instance (via the Menu instance) can be changed 
without changing either of these 2 classes.
Messager is used to send a text message to my mobile phone.
Restaurant inherits from TakeAway class so can use "Restaurant.new" or "TakeAway.new".


GEMS REQUIRED FOR THIS PROGRAM:
twilio-ruby
This gem allows the application to send the final order total to my mobile phone.


WALKTHROUGH:
require './lib/takeaway'
thai = TakeAway.new
thai.read_menu                        # Displays the menu
thai.change_menu "menu1.csv"          # Can change to another menu (mid order) from a csv file.
thai.order "spring roll", 3           # 3 x spring roll(s) added to your order.
thai.order "peking duck", 4           # 4 x peking duck(s) added to your order.
thai.order "xxx"                      # That item is not on the menu.
thai.summary                          # "spring roll" x 3 = £2.97, "peking duck" x 4 = £31.96
thai.total                            # Total: £34.93
thai.checkout(10)                     # Your order total does not match the calculated total
thai.checkout(34.93)                  # Sends text message to my phone if the totals match.

Menu can be used on it's own.
fastfoodmenu = Menu.new               # Created with default menu
fastfoodmenu = Menu.new("menu1.csv")  # Created using a specific menu
fastfoodmenu.read_menu

Menu object can also be loaded into restaurant/takeaway
menu = Menu.new("menu1.csv")
menu.load_menu("menu.csv")            # Menu load file can be changed from Menu object.
thai = TakeAway.new(menu)             # A menu can be passed directly to a takeaway.
thai.menu                             # Shows the menu as a hash.
thai.readme                           # Shows the menu in a readable form.
puts menu.get_details("peking duck")  # Returns a hash of the item and the price if it is in the menu.
puts menu.contains?("pork dumpling")  # Returns a boolean if that item is in the menu.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after 
+I have ordered
```

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. 
  * +If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that 
  * +the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order 
  * +was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to 
  * +send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account 
  * +you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, 
* +don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or 
* +little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance 
+will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when 
+you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
