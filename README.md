set environment variable: https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html

list of dishes with prices - see, select(number)

checkout total - is_correct? (matches total of dishes ordered)

text - receive (and presumably sendir)

MENU - CHECKOUT/ORDER - MESSAGER

first user story:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

first step - made spec file but no class defined

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

2nd user story:

```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

Test-drove Order class initializing with empty array as basket, injecting menu into it, made select_dish method with 2 parameters (quantity defaulting to 1)

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

3rd user story:

```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```

made calculate total method

```
jonnyabrams@JONNYs-MacBook-Pro takeaway-challenge % irb -r './lib/order'
3.0.2 :001 > order = Order.new
 => 
#<Order:0x000000013a0f01f0
... 
3.0.2 :002 > order.select_dish('arrabiata', 3)
3.0.2 :003 > order.select_dish('bolognese')
 => 1 
3.0.2 :004 > order.select_dish('puttanesca', 2)
 => 2 
3.0.2 :005 > order.select_dish('carbonara')
 => 1 
3.0.2 :006 > order.basket
 => 
[["arrabiata", 4.5],
 ["arrabiata", 4.5],
 ["arrabiata", 4.5],
 ["bolognese", 7.5],
 ["puttanesca", 5.5],
 ["puttanesca", 5.5],
 ["carbonara", 6.5]] 
3.0.2 :007 > order.calculate_total
 => 38.5 
```

By [Jonny Abrams](https://github.com/jonnyabrams)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)



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
