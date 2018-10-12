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

Todo
-----
- [ ] Twilio setup
  - [x] Sign up
  - [x] review documentation
  - [x] Send a dummy message
  - [ ] Prevent credentials from entering production
    - [x] .gitignore for dummy test
    - [ ] dotenv and env variables for production code
- [x] Plan braod stroke solution
  - [x] List of methods
  - [x] Methods grouped by shared concerns
- [x] User story 1
    - [x] Feature Tests
    - [x] Unit Tests
    - [x] Tests pass
    - [x] Tests Refactored
    - [x] Code Refactored
- [ ] User story 2
  - [x] Feature Tests
  - [x] Unit Tests
  - [x] Tests pass
  - [x] Tests Refactored
  - [ ] Code Refactored
- [ ] User story 3
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] User story 4
  - [ ] Feature Tests
  - [ ] Unit Tests
  - [ ] Tests pass
  - [ ] Tests Refactored
  - [ ] Code Refactored
- [ ] Gem file contains all dependency gems
- [ ] README
  - [ ] Explain your approach to the challenge
  - [ ] how to set up
  - [ ] show the full story of how your app is used (from a user's perspective)

Considerations
----
- [ ] use ENV variables and the dotenv gem to ensure that sensitive infomration such as phone numbers and security tokens are not pushed up to public repos on Github.
- [ ] Code should be open for extension but closed for modification. For example the menu items should not be hard coded into a restaurant class.
- [ ] Tests:
  - [ ] Should test real behaviours not stubs
  - [ ] Stubb out the Twilio API calls but this still needs testing - see Docs/reviews
  - [ ] All public methods needs to be tested
- [ ] Ensure that methods that should not be available in the public interface are made private
- [ ] Classes
  - [ ] employ dependency injection
  - [ ] Should separate concerns
  - [ ] Each object should have only limited knowledge about other units: only units "closely" related to the current unit.
  - [ ] Each object should only talk to its friends; don't talk to strangers.
  - [ ] Only talk to your immediate friends.
  - [ ] We shouldn't see deep-reaching chains in the code
- [ ] Have a list of dishes with prices
- [ ] Place the order by
  - [ ] giving the list of dishes,
  - [ ] their quantities
  - [ ] and a number that should be the exact total.
  - [ ] If the sum is not correct the method should raise an error,
  - [ ] otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now
- [ ] Use the twilio-ruby gem to access the texting API
- [ ] Use the Gemfile to manage your gems
- [ ] Tests isolated using mocks and/or stubs (do not send texts when your tests are run)
  - [ ] However, if run in IRB and the order is placed, the text should actually be sent
- [ ] Methods should use have a single responsibility
- [ ] 100% Test coverage
- [ ] Code conforms to the Rubocop style guide


Rough Plan for solution
----
Restaurant Class
* Initialise with instances of menu, order and messaging


Order Class
* add_item_to_order(item, number = 1)
* order_summary
  * shows items and quantity
* order_total
* is_correct_amount?(price)
  * total_price == price
* check_out(total)
  is_correct_amount? ? send_sms : raise error


Menu Class
* Initiates with a hash of dishes and prices
* show menu
  * returns dishes with their prices

Messaging Class
* Send text message




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
