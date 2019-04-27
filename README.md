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

## Introduction to the project

This project is part of Week 2 of the Makers Academy 12-week software engineering programme. It focuses on test-driven development and object-oriented programming skills to satisfy the client's requirements presented in 'challenge_instructions.md'.

The aim of this project is to write software for a takeaway according to a set of user requirements. The program enables the user to view a list of dishes with prices and select some dishes they want to order. There is built-in verification within the program to check that the total cost/bill of the order matches what is expected given what the user has ordered. 

The user will confirm that they want to place the order. Once the order is placed, the user will receive a text message that their order will be delivered before the (order time (+ 1hr)).

## Motivation: What are my goals for this project?

#### For this challenge, I am specifically targeting the following Makers Academy goals:

**I can make anything**

- I can TDD anything
- I can debug anything
- I can model anything
- I have a methodical approach to solving problems

**I am equipped for long term growth**

- I can learn anything by myself

#### Relating to the above high-level goals, I would like to:

- Document and explain the processes and approaches I used

> This is presented in: 'kd_approach.md'.

Concrete things
- Apply the RSpec testing framework to test-drive the program

Concepts
- Understand how to test-drive objects & methods and apply dependency injection to delegate tasks to other objects

Processes
- Use test-driven development to test-drive a simple takeaway program using objects and methods

Behaviours/mindset
- Take a step back to understand and break down requirements into user stories and test cases

## Tech/Framework Used

**RSpec will be used as the testing framework.**  

>"RSpec is a Behaviour-Driven Development tool for Ruby programmers. BDD is an approach
to software development that combines Test-Driven Development, Domain Driven Design,
and Acceptance Test-Driven Planning. RSpec helps you do the TDD part of that equation,
focusing on the documentation and design aspects of TDD." 

See documentation:
https://relishapp.com/rspec
http://rspec.info/

**Ruby will be used as the programming language.**

**SMS messages are sent using the Twilio REST API.**

Twilio’s Programmable SMS API helps you send and receive SMS messages. 

The RubyGem `twilio-ruby` provides a simple library for communicating with the Twilio REST API, building TwiML, and generating Twilio Client Capability Tokens.
See documentation for more info:
https://rubygems.org/gems/twilio-ruby/versions/4.11.1
https://www.twilio.com/docs/usage/api

**Managing environmental variables - API key / auth**
I used the RubyGem `dotenv` to manage environmental variables for the Twilio API - account_sid and auth_token.
https://rubygems.org/gems/dotenv/versions/2.2.1

## Code Style

I will be checking my code conforms to the [Rubocop](https://github.com/bbatsov/rubocop) style guide.

## How to use the takeaway program

### 1. Getting Started

-  For the first iteration of the product, this software will be usable in Interactive Ruby via the terminal using `irb`. Note this functional, but there are usability improvements to be made for the user experience.

-  Go to the terminal and type in `irb` from the root directory (main folder) to get started.

- Once in `irb`, type in the following to `require` the dependencies.

```
require './lib/takeaway.rb'
require './lib/order_management.rb'
require './lib/food_menu.rb'
require './lib/twilio_message.rb'

```

All the files are now available! Next, you can follow the following steps to create your world!

### 2. Creating a Menu

- To create a menu, type in the following into your `irb`

```

food_menu = FoodMenu.new({naan: 0.90, penang_curry: 5.00, spare_ribs: 6.00})

```

*Note* For this implementation, there is additional setup for the order management and twilio messaging to work. 
I hope to refactor this later on. 

```
#Associate the `order_management` to the `food_menu`
order_management = OrderManagement.new(food_menu)
twilio_message = Message.new

```

You can create as many menus as you like!

### 3. Creating a Takeaway

- Once we have a menu, order management and messaging system in place, we can associate it with a takeaway, type in the following into your `irb`

```

takeaway = Takeaway.new(food_menu, order_management)

```

### 4. Placing an order

Now, you can place the order at the takeaway.

```
takeaway.place_the_order({naan: 2, penang_curry: 2})

```

### 5. Check the message received

At the moment, this is hard-coded to my mobile number. This is an area to improve.

**Enhancements:**

**To improve my project, next time I would like to:**

- Get test coverage from 99.14% to 100%
- I haven't tested the Twilio API implementation for sending the text message to the customer. Next time, I would like to learn how to implement RSpec tests for APIs
- I would like to learn how to stub out the behaviour of the Twilio API in my RSpec tests. At the moment, when I run my tests, the Twilio API sends a text message to the customer

- For an improved user experience, I would like to create an interface for usability, asking the customer questions such as: 
> 'Would you like to view the food menu?'
> 'What would you like to order'?
and then giving them a response.

For version 1, my project is functional in technical implementation, but is not responsive to user input. I would also like to improve the way the dishes are stored and presented.

At the moment, the messaging is hard-coded to my mobile number. This is an area to improve by asking the user to provide a mobile number and for that mobile number to work with the Twilio service!


## Images/Screenshots

## Getting started

`git clone https://github.com/kimdiep/takeaway-challenge.git`

## Running tests

Tests can be run from the root directory using:

`rspec`