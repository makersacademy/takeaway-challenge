Takeaway Challenge - own reflections
====================================

How to use the code

I have stored some simple irb commands in the file ./docs/automate_feature_test.rb.
Acquire a local copy of the repo, start irb in your terminal, and paste the commands
in this file. This will enable quick feature testing.

Introduction

I began by thinking about the user stories and the functionality they imply. 
I summarised the nouns(objects) and verbs(methods) against suggested classes 
on a piece of paper of first of all. This allowed me to make a quick start 
and change things quickly.

Once I had a rough sketch of the architecture, I formalised it on drawio 
(https://app.diagrams.net/#G17wSsZ0ACXd_0gc3a-v9S4KkjGQvQ8mYR).

To help me maintain functionality and enable unit and feature tests from the 
start, it was important I started with the class that had no dependencies, 
ie the dish class.

Coding

I TDD'd the Dish class, which produces dish objects, eg { "Chicken Korma", 8.99 }

Then I TDD'd the Menu class, which produces a list of dishes. Tests were isolated.

Then I TDD's the Order class, which acquires a menu, and has functionality 
like 'add dish to order' and 'show total'. Tests were isolated.

The above steps were straightforward. The place_order method of Order requires 
the sending of an sms. Working with twilio, the text messaging app, was more 
challening. I spent some time researching environment variables, then used the 
twilio tutorial to enable text messages to be sent manually. Integrating it 
(so that texts would be sent automatically) was difficult, as there were many 
errors, and I wasn't clear of the cause. Once I had used information in the 
error messages to get it to work, I then hashed it out and TDD'd it. Technically
this violated the red-green-refactor process of TDD, but I didn't know in 
advance what I was going to be testing. In particular, I took the sample code 
provided by twilio and turned it into a regular ruby class with methods. This 
standardised the formatting and made it easier to test. I wrote isolated tests.

Notes

The send_sms test for send_sms (line 21) is circular, becuase it only tests the
output of something defined in the line above it. However, the test is not 
redundant, because without this 'dead-end', the unit test would run the actual 
code, and result in an actual text message being sent - the specification 
required that this did not happen. 

Coverage is 99.15% overall, including the circular test described above.

Coverage for the send_sms.rb file is 92.86%. 1 line is missing a test, line 20, 
but this seems minor.





Takeaway Challenge - Original task
====================================
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
