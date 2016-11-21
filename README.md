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

## Simon's walk through


### Aims for the takeaway_challenge

The takeaway lets a user view the menu, place and order, check their basket and pay for their food. The user receives a text message when the order is placed.

### Steps for setting up

To set up the app we need to add the following commands to Pry:

[simon:~/projects/takeaway_challenge]$ pry                                   (sunday✱)

####[[1] pry(main)> require './lib/takeaway.rb'
=> true
####[2] pry(main)> takeaway = Takeaway.new
=> #<Takeaway:0x007fc77a113c28
 @menu=
  [[1, "Margerita pizza       ", 5.5],
   [2, "Pepperoni pizza       ", 6.5],
   [3, "Quatro Staggioni Pizza", 6.5],
   [4, "Donner Kebab          ", 3.5],
   [5, "Cheeseburger          ", 5.0]],
 @menu_klass=
  #<Menu:0x007fc77a113bd8
   @menu=
    [[1, "Margerita pizza       ", 5.5],
     [2, "Pepperoni pizza       ", 6.5],
     [3, "Quatro Staggioni Pizza", 6.5],
     [4, "Donner Kebab          ", 3.5],
     [5, "Cheeseburger          ", 5.0]]>>
[3] pry(main)>

This loads in the project files.
It then starts a new takeaway.
The menu is loaded into the takeaway from a separate menu file.


###Placing an order

To place an order you can do the following:

####[3] pry(main)> takeaway.new_customer
Welcome to my takeaway! Please look at the menu

[1, "Margerita pizza       ", 5.5]/n
[2, "Pepperoni pizza       ", 6.5]/n
[3, "Quatro Staggioni Pizza", 6.5]/n
[4, "Donner Kebab          ", 3.5]/n
[5, "Cheeseburger          ", 5.0]/n

Type in the menu number for your order. Type 0 to complete your order


This starts the customer interaction.
The customer can add menu items by typing the menu number.
E.g. 1, 2, 3, 4
As they type in the items they want, the order is displayed for the customer to see.

1
[1, "Margerita pizza       ", 5.5]
Type in the menu number for your order. Type 0 to complete your order
2
[1, "Margerita pizza       ", 5.5]
[2, "Pepperoni pizza       ", 6.5]
Type in the menu number for your order. Type 0 to complete your order
3
[1, "Margerita pizza       ", 5.5]
[2, "Pepperoni pizza       ", 6.5]
[3, "Quatro Staggioni Pizza", 6.5]
Type in the menu number for your order. Type 0 to complete your order

Note - Currently, unrecognized entries are always added as a cheeseburger. I would like to have added a feature so unrecognized are removed from the list.


####Completing the order and paying

When the customer types 0 the order is completed.
This shows the price.
The customer is asked to add the price again.
If they type in exactly the price the order is completed and a text message is sent.


Type in the menu number for your order. Type 0 to complete your order
0
[1, "Margerita pizza       ", 5.5]
[2, "Pepperoni pizza       ", 6.5]
[3, "Quatro Staggioni Pizza", 6.5]
[5, "Cheeseburger          ", 5.0]

Your total bill is £23.5
To pay your bill, please type in the total of 23.5.
23.5
PAID! Please come again!!
=> <Twilio::REST::Message @path=/2010-04-01/Accounts/AC67a8668352fe266e4a97871ce36e7ec8/Messages/SM1673f36db41441d899e65c1087b7a893>
[4] pry(main)>

Note - Currently an additional cheeseburger is added when the user completes their order. I would like to remove this.

















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

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Build Badge Example
------------------

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
