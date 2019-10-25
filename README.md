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

Challenge Process Log

Forked repo and downloaded to projects folder.

Changed to Ruby version 2.5.0 after being prompted when accessing the directory.

Ran 'bundle' to ensure all required gems are installed.

Read through challenge.

Transfer user stories to spec/user_stories.rb

Review user story 1 and use IRB to establish possible required functionality.

My interpretation of this user story is that the "customer" needs to view a list of "dishes" with corresponding "prices"

Create customer_spec and customer file.

Create test in customer spec file to test a customer can call on a method view_dishes.

Test working.

First commit + push complete.

Add hash with dishes to customer spec menu.

Realise I've been leading with a customer class because thats what I viewed as being most prominent when I first read the user stories.

Review user stories and draft possible structure on paper.

Decide there are 2 classes Customer and Shop.  The shop will have a menu which the customer will use to select dishes and place / check an order.

Delete all current code and start again with blank versions of customer and customer spec. Keep user_stories and README as they are.

Create shop lib + spec files

Have been unable to pass tests with use of doubles.   Will stat again from scratch with a more complete plan  before implementation.

NEW PLAN:

As this new plan also incorporates user stories I've deleted the user_stories spec file and all other files and will start with a completely new codebase.

USER STORY 1
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

PLAN
1.Create Customer class + Takeaway class.

2.Create a method called view_menu in takeaway class.
NB changed view_menu to customer class.  
When running test in IRB realised it will be the customer that will be calling the menu.
Test worked as expected in IRB but not Rspec.

3.In view_menu create a hash called 'menu' with dishes and prices as key value pairs.
When a customer calls the 'view_menu' method the 'menu' hash has will be returned.
NB Test worked as expected in IRB but not Rspec.

USER STORY  2
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

PLAN
Create a method called 'menu_selection' in the customer class that will take the customers dish
selections from 'menu' and store the key/value pair in a new hash called 'customer_order'.
use loop to keep asking customer for selections until customer says submit order

USER STORY 3
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given
matches the sum of the various dishes in my order

PLAN
Create method called 'view_order' in customer class that will display the
'customer_order' hash and a message displaying the total value of the
hash values using string interpolation.

USER STORY 4
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you!
Your order was placed and will be delivered before 18:52" after I have ordered

PLAN
Create a method called 'place_order' in the customer class
When customer runs method run twillo integration to return text message
