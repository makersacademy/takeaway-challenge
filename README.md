## Project title
* Takeaway Challenge

## Motivation

Client request for a program that can perform the following functions.
* Print a list of dishes with prices.
* Select dishes from the list using numbers.
* Check the number of dishes and the cost.
* Receive a thank you message with the delivery time.
* Bonus: Send a text message with the thank you message and the deliveery time.

## Build status
* Initial files being created and dependencies installed
* Wrote the menu_spec.rb file that contained a tests.
* Created the menu.rb file with the menu class that holds the dishes. 
* Wrote the takeaway_spec.rb file that contained the tests. This also has a double for the dishes.
* Created the takeaway.rb file that has the functionality to print the menu, select dishes with a number and confirm the order with a text.
* This code passes all the allocated tests and the text message system worked. Howeverv, I do not know how to write a test for the send_text method.
* My account details for the send_text method have been removed.

## Code style
* Test-driven development
* Pair programming (Navigator/Driver)

## Tech/framework used
* VS Code (Live Share)
* Twilio API
* GitHub
* Rspec
* Bundler
* Zoom

## Built with
* Ruby
* Twilio API
* Rspec

## Installation
* Run bundle
* Create and and sign into your Twilio account
* Follow the steps Twilio provide you with
* Replace the require details as per the comments in the code.
* Test in irb
* You should receive a text message 

## Tests
* Initially ran the test in irb as I thought the program should run.
* Wrote the spec tests for each file.
* Ran tests to respond to the 2 classes.
* Ran tests on methods.
* All errors were fixed as the tests and the code was developed.

## How to use?
* Create a new takeaway order - takeaway = Takeaway
* Select your dishes - takeaway.select(3); takeaway.select(4)
* Send a text message confirming the order - takeaway.send_text

## Credits
* JP Ferreira
* Dewald Viljoen

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
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
