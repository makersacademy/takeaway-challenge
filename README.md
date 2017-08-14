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
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.

-----------------------

Will's approach:

First, I created the Menu class that had functions for adding dishes (either individually or by importing), removing dishes and displaying the menu. The menu items were stored as a hash, with keys representing dishes and values representing prices. I initially wrote this with symbols, but decided that it was more logical for menus to have strings as the dish name (as each dish should be called something different anyway). Initially I had the menu stored as an array of many different one-key-value-pair hashes, but in the end realised that a single hash would more efficiently achieve the same outcome. This made my code a lot less clunky!

I then wrote a Restaurant class which just executed the steps in menu. This class was perhaps slightly redundant, but was done with the thought that a restaurant might have more than one menu and that this would be easier to implement through this approach. In the end, I did not do this, but it could have easily been achieved by allowing each Restaurant instance to have more than one menu.

Finally I wrote the takeaway class. This initialized with a restaurant (as each instance of a takeaway is [usually] from one restaurant) and a phone number that would a) differentiate the customer and b) enable a text to be sent.
I also initialized with an empty order list and payment card, as well as the current time (+1hour) and a message to be text. I also set an instance variable @texter in order to store an instance of my Texting class. I then wrote an attr_accessor for this so that I would be able to replace Texting.new with a texting double for testing and thereby avoid endless texts being sent to my phone and potentially burning through my free credit!

The takeaway class could read the restaurant's menu (very basic).
The takeaway class could select a number of dishes, one at a time (with a default quantity of one). This was then added to the order array.
The show_basket method showed all items ordered by item. It relies on the order being placed accurately although I could have possibly added in an error message for when items were not on the menu. The method summarised the quantity and pricing of each item ordered.

Checkout went through a series of checks before showing the basket, taking card details and closing the order, before sending a confirmation text that the order would be delivered within an hour (specifying the time it would arrive).

All of the code was written test first aside from the Twilio stuff as this was difficult to test properly although I did manage to achieve 100% coverage with a string of mocks; however, much of the comfort relied on the feature test, and the fact that the documentation for Twilio had come from their website.
