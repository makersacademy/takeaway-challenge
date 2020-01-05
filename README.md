# Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  C.W. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
### Outline

Makers Academy weekend challenge to create a simple app incorporating the Twilio Gem, which allows a customer to send a food order directly or via text, and recieve a confirmation text once the order is confirmed.

### How to Install & Example

The application is run directly from the command line, so to install simply clone or fork the repository, change directory to the root folder, open irb, and paste the following code:
```
require './lib/takeaway.rb'
```
Alternatively, run *rspec* to see the test documentation or the example script to see an overview of the program functionality.

### Customer Requirements

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
--------
### Approach

#### Extract Scope
- Method to provide list of dishes and corresponding prices
- Method to send order directly, hints outline order is placed by sending list of dishes, quantities, and order total, since there is no mention of input data type, this will be implemented as a hash for flexibility. Also no mention of of when to input phone number, this will be included in the order
- Method to send order via text message, order will have to be placed as SMS string, to be implemented via twilo webhook. Menu to be updated to include order by text format and number
- Behaviour to check order total is correct and error if not
- Behaviour to send text confirmation to client phone number

#### Notes
- Twilo account details will be implemeneted via environment variables

#### Objects & Public Interface
Relatviely simple program so should only require one object
- Takeaway
  - #show_menu - returns menu in pretty format
  - #place_order(order) - places order accepting hash

#### Create RSpec for basic object functions and implement TDD:
- Takeaway.show_menu


--------
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
