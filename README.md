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

Introduction
---------

The aim of this project is to build a takeaway program to meet the user requirements. The program enables the user to view a list of dishes with prices and select some dishes they want to order. There is build_in verification within the program to check that the total cost/bill of the order matches what is expected given what the user has ordered.

The user will confirm that they want to place the order. Once the order is placed, the user will receive a text message that their order will be delivered before the order time (+1hr).

This project is provided by Makers Academy. It is the second weekend challenge and focuses on skills developed over the course of the week, specifically delegation and encaspsulation within TDD.

Motivation
----------

The purpose of this project is to work of my weekly focus goals:

### I can TDD anything

* Apply the TDD approach
* Application of effective delegation throughout the challenge. Refer back to delegation workshops earlier on in the week.
* Unit test classes in isolation using mocking.

### I can program fluently

Continue to refine the structure of a ruby project and broaden depth of syntax knowledge.

### I can debug anything

Consolidate debugging process within TDD.

### Specific goals

* Focus on the following weekly goals:
  * Mocking and stubbing
  * Delegation

* Develop understanding of RSpec functionality.

Build Status
---------

Complete:

* 

Working progress:

* Incomplete. All in progress.

Tech/Framework Used
---------

This project will use Behaviour Driven Development (BDD) for Ruby with the RSpec testing language.

Code Style
--------

I will be checking my code conforms to the [Rubocop](https://github.com/rubocop-hq/rubocop) style guide.

How to use the takeaway program
---------

### 1. Getting Started

When complete this will give a step-by-step guid on how to run the takeaway simulation

Getting started
---------

To start you will need to download the program onto your terminal. Do this by entering the directory you wish to copy to and execute the following.

`git clone <place line here>`

Once download enter `irb` and you'll be ready to run your takeaway business!

Running tests
---------

Tests can be run from the root directory with:

`rspec`

Thank you for reading and I hope you have fun with the takeaway simulation!

Domain Model Diagram
--------

Approach
--------

##CLIENT REQUIREMENTS



##USER STORIES

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

PROGRAM USAGE

* For the first iteration fo the product, this program will be usable in Interactive Ruby via the terminal using `irb`

### STEP 1 - SKETCHING OUT THE DOMAIN MODEL

Translating the user stories into a domain model

### STEP 2 - SET OUT THE OBJECTS / CHARACTERISTICS / INTERACTIONS

From the user stories, set out the objects and their interactions (messages) to be modelled

### STEP 3 - DEFINE METHODS AND WHAT THEY DO

Now that the domain model, objects and their interactions are clear, set out the methods

### STEP 4 - DEFINE TEST CLASS

Now I set out the test cases

### STEP 5 - TDD PROCESS

Using the notes gathered in the above five steps, go through the TDD process

* USER STORY
* FEATURE TEST
* UNIT TEST
* CODE IMPLEMENTATION
* FEATURE TEST

## CLASSES/OBJECTS

* Takeaway - controlling class, delegates responsibility
* Foodmenu
* OrderManagement
* Messaging Service
* Twilio API - Authentication (account_sid, auth_token)

## DOMAIN MODEL/SEQUENCE DIAGRAM

## STORIES

### STORY 1
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```

**OBJECTS**

* Takeaway
* Menu

**MESSAGES**

* A list of dishes and prices will be held in `menu`
* `takeaway` will have a `print_menu` method in which it will delegate responsibility to `menu`
* `menu` will have a `print` method

**TEST CASES**

Takeaway:

-[X] It shows a menu with dishes and prices

Menu:

-[X] It contains a list of dishes with their prices
-[X] It prints a list of dishes with prices

### STORY 2
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```

**OBJECTS**

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
