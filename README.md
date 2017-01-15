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
## User Stories

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
## Feature Tests
#### Menu
```
[1] pry(main)> require './lib/menu'
=> true
[2] pry(main)> menu = Menu.new
=> #<Menu:0x007f9adf4c4cb8
 @menu_items=
  [{:no=>"01", :dish=>"Yase Soup", :price=>2.5},
   {:no=>"02", :dish=>"Wan Tan Soup", :price=>3.2},
   {:no=>"03", :dish=>"Tori Mushi", :price=>3.0},
   {:no=>"04", :dish=>"Tom Yam Soup", :price=>4.5},
   {:no=>"05", :dish=>"Tori Yam Soup", :price=>3.5},
   {:no=>"06", :dish=>"Umami Soup", :price=>4.5},
   {:no=>"07", :dish=>"Beef Tatar", :price=>5.8},
   {:no=>"08", :dish=>"Moyashi Salad", :price=>3.0},
   {:no=>"09", :dish=>"Kimchi Salad", :price=>3.4},
   {:no=>"10", :dish=>"Hokkaido", :price=>6.5},
   {:no=>"11", :dish=>"Shapu Salad", :price=>4.0}]>
[3] pry(main)> menu.view
                   Yume's menu                    
                   -----------                    
  Food name ------------------------------ price  

01.Yase Soup                              ...EUR 2.5
02.Wan Tan Soup                           ...EUR 3.2
03.Tori Mushi                             ...EUR 3.0
04.Tom Yam Soup                           ...EUR 4.5
05.Tori Yam Soup                          ...EUR 3.5
06.Umami Soup                             ...EUR 4.5
07.Beef Tatar                             ...EUR 5.8
08.Moyashi Salad                          ...EUR 3.0
09.Kimchi Salad                           ...EUR 3.4
10.Hokkaido                               ...EUR 6.5
11.Shapu Salad                            ...EUR 4.0
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

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
