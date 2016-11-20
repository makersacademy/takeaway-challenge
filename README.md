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
[1] pry(main)> require'./lib/takeaway'
=> true
[2] pry(main)> takeaway = Takeaway.new(Menu,Order,SMS)
=> #<Takeaway:0x007fb1b22daa08
 @menu=#<Menu:0x007fb1b22da9e0 @list={"Curry"=>9, "Burger"=>8, "Pizza"=>10, "Noodles"=>5, "Chicken"=>5, "Kebab"=>6}>,
 @order_klass=Order,
 @sms=#<SMS:0x007fb1b22da990 @client=<Twilio::REST::Client @account_sid=ACb887cc19fc9926f36fd0812f733c588a>>>
[3] pry(main)> takeaway.view_menu
Curry £9
Burger £8
Pizza £10
Noodles £5
Chicken £5
Kebab £6
=> {"Curry"=>9, "Burger"=>8, "Pizza"=>10, "Noodles"=>5, "Chicken"=>5, "Kebab"=>6}
[4] pry(main)> takeaway.begin_order
=> #<Order:0x007fb1b21b9610 @basket={}, @menu=#<Menu:0x007fb1b22da9e0 @list={"Curry"=>9, "Burger"=>8, "Pizza"=>10, "Noodles"=>5, "Chicken"=>5, "Kebab"=>6}>>
[5] pry(main)> takeaway.add("Burger",1)
=> 1
[6] pry(main)> takeaway.place_order(8)
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/ACb887cc19fc9926f36fd0812f733c588a/Messages/SM056f63e311484e06a34a8ccc3c1f5d8f>
[7] pry(main)> quit
[chriscooper:...rs/week2/takeaway-challenge]$
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
