# Takeaway Challenge

[Getting started](#getting-started) | [Usage](#Usage) | [Running tests](#running-tests)

[User stories](#user-stories) | [Approach](#Approach) | [Areas for improvement](#Areas-for-improvement)

This is one of the weekend challenges from the Makers Academy course.

It is a program that can be run in REPL: a customer should be able to see a list of dishes with prices, select a number of available dishes, see the total of their order and receive a text message to confirm their order and give them a delivery time.

[See here](https://github.com/makersacademy/airport_challenge) for Makers' original repo.

### Getting started

Fork or clone this repo:      
`git clone https://github.com/amyj0rdan/airport_challenge`     
`gem install bundle`     
`bundle`     

### Usage

Run in `irb`     
Requires Twilio account to be set up. Add the following environmental variables to your `.env` file:     
TWILIO_NUMBER = 'YourTwilioPhoneNumber'     
TWILIO_ACCOUNT_SID = 'YourTwilioAccountSID'     
TWILIO_AUTH_TOKEN = 'YourTwilioAuthToken'     
PHONE_NUMBER = 'YourVerifiedPhoneNumber'

### Running tests

`rspec`

## User stories

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
## Approach

- Produced class diagram that had Takeaway, Menu and Message classes     
--- This emerged into Order, Menu and Message classes in the process of implementing the code
- Produced a sequence diagram to describe how I expected the classes to interact with each other
- Predominantly TDD-ed this. However, with the implementation of Twilio, as I had never used this gem before I did play around with it before actually writing tests to double/mock behaviour.

## Areas for improvement

- Increased test coverage to 73.33% in the Message class - still room for improvement but much better.
- 'print_menu' method in Order class return is tested. However, I think this is just testing the return of the Menu class rather than the behaviour of the Order class.
- Resolved failing test in Order class for 'sending a test to the customer'.    
- Could give more though to edge cases (eg, typos in adding items to the order)
- Could have had another class of Takeaway that interacted with the other classes of Order, Menu and Message. However, could this become a god class?
