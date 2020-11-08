
Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            | A.W.S |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```


My solution to the Makers Academy Week 2 challenge, building a Ruby app for a restaurant in which a user can place orders. This was an exercise in TDD, including the extensive use of mocking to prevent class and API dependencies being hardcoded, as well as OOP and some basic Polymorphism.  It was also my first experience using the Twilio API.

My Implementation
-------
I broke the user stories down into several interacting classes.

 - **Restaurant**: the main object that holds all others together.
 - **OrderHistory**: a list of orders with the capability to generate new orders.
 - **Order**: a list of food, and associated methods.
 - **Good**: a parent class to **Food** and **Drink**, done to make the classes as universally applicable as possible for the projects longevity.

All unit testing has been completed using mocking to ensure that the code would be easy to change, as well as to test Twilio without making a real API call. I've then implemented a demonstration of the classes working together in the './demo.rb' file.

The idea was to make everything as modular and customisable as possible, to ensure that you could use this code as a jumping off point for a platform hosting multiple restaurants and serving multiple customers.

Installing the app
-------

 - Clone the Github repo
 - Register for a free Twilio account
 - In the parent directory, create a file called .env
 - Add to this file your Twilio API key, token, to and from numbers as outlined here:
         
       export TWILIO_ACCOUNT_SID='XXXXXXXXXXXXXXX'
       export TWILIO_AUTH_TOKEN='XXXXXXXXXXXXXXX'
       export TWILIO_TO=+44XXXXXXXXX
       export TWILIO_FROM=+44XXXXXXXXX
       
 Example Usage
-------

    ❯ ruby ./demo.rb
    Enter:
    1 to see the menu
    2 to add to your order
    'confirm' to place your order
    'quit' to cancel
    > 1

    Menu
    -----------------------
    Item #1: Garlic Bread - £4 (Starter)
    Item #2: Olives - £2 (Starter)
    Item #3: Halloumi Fries - £4 (Starter)
    Item #4: Margherita Pizza - £8 (Main)
    Item #5: Caesar Salad - £8 (Main)
    Item #6: Ice Cream Sundae - £6 (Dessert)
    Item #7: Beer - £4 (Drink)
    Item #8: Cola - £3 (Drink)

    Current order:
    Your basket is empty
    
    Enter:
    1 to see the menu
    2 to add to your order
    'confirm' to place your order
    'quit' to cancel
    > 2
    Input the Item Number:
    > 1
    Enter the quantity you'd like:
    > 5

    Current order:
    Item #1: Garlic Bread - £4 (Starter)
    Quantity: 5
    Total: £20

Assignment Brief
-------
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

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.