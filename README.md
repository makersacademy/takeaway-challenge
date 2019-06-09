First attempt at Takeaway Challenge
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
Task
-----
Write a Takeaway program 

User Stories
-------------
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

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`to install the dependencies
4. Complete the following task:


## Approach
A test driven approach was required for the task, utilising object oriented principles to create the appropriate classes and methods for a solution. I utilised mocks where possible, in order to test classes in isolation.

#### User story -> Modelling -> Feature test -> Unit Test -> Red-Green-Refactor

I chose to start with three main classes:

**Restaurant** responsible for managing a customer's order

**Order** responsible for creating new items in the order

**Menu** responsible for managing the menu

## Technologies

**Ruby 2.5.0**

**RSpec 3.7** testing framework

**Rubocop** code liniting

**SimpleCov** test coverage gem

**Pry** debugging tool

## Progress

I have satisfied the first two user stories, need more work to cover the rest, as well as the Twilio integration.

#### Things to improve

* Remove dishes constaant, allow menu to be inserted when intitialized (Open Close Principle)

* Add tests for Order class

* Use BigDecimal instead of floating points for prices - more accurate 

* Add feature tests to cover class interaction

* Feature tests - add to a Spec file

* Practice building mental model of the problem

* Start small - try to relax

* Practice using doubles more

* Focus

## Resources

* https://ruby-doc.org/stdlib-2.5.1/libdoc/bigdecimal/rdoc/BigDecimal.html


Instructions
---------
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`to install the dependencies


