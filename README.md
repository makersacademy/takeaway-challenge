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

My Challenge
--------
### Getting started
`git clone https://github.com/samanthaixer/takeaway-challenge`
`bundle` to install the gems required

### Usage

`irb -r XXX` to run from within `irb`


### Running tests

`rspec` to run all test files except the feature tests
`rspec spec/features/indian_takeaway.rb` to run just the feature test

Note: features tests use a double and mocks instead of sending the text message

### My approach
1. First capture the verbs and nouns
Customer
Menu (dishes) - view
Dish - select, available
Order - create_order, complete_order, count_items, matches_total?
Text_message - create, send, receive

2. Second draw some diagrams
This bit I have found hard. I still am not sure how I would design something just from drawing diagrams. Building the code through tests helps me formulate what I am trying to do.

3. Start building tests
- First I started building out the dish class. We can't have a menu or an order made up of dishes without a dish itself! Of course, this was built using TDD. I actually can't imagine not using TDD for my coding, it guides my design so much!

4. Somehow build out the functionality
- I mostly followed TDD for this but definitely found a couple of occurrences where I didn't spot the test until I had written some code.
- I built out user stories 1 - 3 before even attempting story 4 (to add the text message)
- I built out non-double tests first to check my functionality and then introduced doubles. When I removed the original tests, I checked that the double tests broke when I changed the code in the class that I was testing
- I used dependency injection and understood it to the level of injecting a double object

5. Look to send texts
- To implement the functionality seemed easier than I expected. I added twilio-ruby and dotenv to my gem file so that I could use environment variables. So far so good. But for some reason, I just can't get twilio to send to my mobile number. It returns an error saying that my mobile number isn't valid.
- Ignoring the error, I then built out further tests to mock the sending of the message so that other classes don't test the actual send. However, given that this isn't yet working, I haven't finished my dependency injection or the actual implementation.
- I noticed that I understood my dependencies and therefore the injection part much better when I used my sequence diagram.
- I remembered that I can mock a method rather than a whole class which helped me test most but not all of the send_text functionality without needing to actually attempt to connect
- I think there is potential to extract a connection class but I think it's beyond me today


# The other details of the challenge

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
