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

 Intro
 ---------
 This is my submission for the second weekend challenge of the Makers Academy course. The idea was to build a ruby programme that simulates some of the functionality you might want from a takeaway app, as described in [Task](#task) below.

 The Code
 -------
 - There are four classes over four files: dish, menu, order and text
 - Dishes have a name and a price
 - Dishes are added to a menu, which will check if a dish with that name already exists
 - An order is then set up with a given menu, and dishes from the menu can be added to the order
 - Once you place an order, a text confirming the delivery time is sent from a text object
 - The text uses the twilio-ruby gem to interact with the Twilio API
 - Sensitive information (Twilio access info, phone numbers) are stored in environment variables

My Approach
 --------
 - Built in ruby, spec written using rspec, and using rubocop for style checking.
 - Using twilio-ruby to interact with the Twilio API, and Dotenv to control environment variables
 - I tried to use a TDD approach when coding this challenge.
 - I started off by converting the user stories given into a [domain model](docs/domain_model.md). This was a more thorough domain model than for the airport challenge, having had a workshop on domain modelling in the week. It separates out objects and actions, with properties and methods listed by class. Having a thorough plan definitely helped when it came to writing the code.
 - Then, starting with the first user story, I built features one at a time, ensuring all tests still passed.
 - I tried to ensure I was committing regularly - pretty much after every test was passed.
 - I then would often refactor to follow the SRP as much as possible, meaning there are lots of short methods, but hopefully the result is easy to follow.  
 - I also tried to make sure I wasn't over-engineering, which I think I did last week a bit. I made sure to only create what was in the user stories, rather than overcomplicating things for myself.

 New Learnings
 ---------
 - This was the first time I had used environment variables in any actual code. Storing them in a .env file (not committed to Github of course) and then using the Dotenv gem to load them on deployment of the code was relatively painless.
 - I used mocking in a couple of places which took me a while to set up and make sure I was checking the right inputs for it. I feel a little uneasy still with whether some of the tests I've done are completely rigorous but I think they'll do.
 - Using Twilio was a first for me, and indeed it was the first time I've built something in Ruby that interacts with something outside of its own environment. Setting it up was easier than testing it, since Twilio have some good documentation on using it.

 Issues Encountered
 --------
 - Drew back from over-engineering the basket - the user stories actually don't look at a way to look at the basket contents for example, only the price of what's in there. This was something I began thinking about how to build before realising I didn't need to.
 - I began fiddling about with calculating the item price for things in an order from the order class, but then realised this should be functionality of the menu, so moved it into there.  
 - Having added `Menu#select_price` to solve the above issue, I realised that `#select_dish` actually wasn't being used, but I decided to leave it in there as it would likely be useful with only very slightly more complex functionality required.

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
