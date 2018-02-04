Marcus' README Edits - My approach and mini code review
=================

My approach
---------
* I started off reading through all the instructions and user stories to get an overview of the different elements
* I then attempted to diagram out some of the core classes, functionality and interaction - though I didn't find it easy to work through this all up front
* In writing the code, I aimed to structure behaviour in different classes, use dependancy injection and apply the single responsibility principle to another level of depth
* I also attempted to make the tests I wrote independent, though this proved difficult without heavy stubbing due to a significant number of dependencies
* I followed the BDD process, though came off the track at certain points where I found the tests hard to construct in advance e.g. Printing out a whole menu that was properly stubbed to isolate the test
* I attempted to set up the code so that it could be used for any ordering process, with the dish file being interchangeable with any other product file. In hindsight, this added a significant amount of complexity


Mini personal code review: My appraisal of my attempt at the weekend challenge
---------
* I found that I made the challenge incredibly difficult for myself and added a lot of complexity. Versus the code I have written up to this point, this was the most uncomfortable code writing process I had, including slipping away from some core good processes I have followed in the past.
* Overall, though I fulfilled all the user stories and functionality, including using Twilio to send texts via ENV variables, I was not pleased with the structure of the code or the tests from an early stage.
*  Rather than restarting anew I bottomed out this example so that I can analyse and deconstruct where I am going wrong with a coach and look to target those areas for improvement going forwards

Things I believe contributed to the poor code structure / tests:
---------
* A lack of using ‘Tell, don’t ask principle’. Returning values back at loads of points within calls, rather than getting other method to complete the action. I think because this was the first time using Dependency injection, I was not used to the number of dependencies it can create by relying on access to the other classes. Using dependency injection and trying to go to the next level of the single responsibility principle introduced complexity and dependencies across the code base that I had not encountered before.
* Over the past 2 weeks I learned lots of new concepts and tried to apply them all at once at the beginning, which overwhelmed my core coding process. I need to return to your core processes, most fundamental of which is algorithmic thinking to ensure I do not bite off more than I can chew.
* When I receive a vague/ high level user story - I need to ensure to break it down into units, which I can then build towards
* When I became unhappy with the code I cut some corners in following the BDD process. Later on I righted the ship by applying a growth mindset, and began looking at the code and experience through the filter: what can I learn from this?
* I learned that minimising dependencies is absolutely crucial, particularly in relation to tests. When doing the takeaway challenge, using dependency injection and trying to go to the next level of the single responsibility principle introduced complexity and dependencies across the code base. If have lots of criss-crossing dependencies, this will create huge issues for testing, as all the dependencies will need to be stubbed to isolate the tests
* Plan and re-plan. Don’t plan at the start and then not go back to diagram. Keep diagramming as you go along rather than only relying on diagrams at the start

Outstanding questions from the exercise:
---------
* Something fundamentally wrong in my code structure - data and/or class structure has issues when using multiple classes and dependancy injection
    * Should quantity be stored as an instance variable for an object?
    * Should I focus on storing objects with info rather than using e.g. a hash?
* Is stubbing the problem or are my dependencies the problem?
* Why should I not stub instance variable values? Is this because it shows I am not following ‘Tell, don’t ask’?








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
