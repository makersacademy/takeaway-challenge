# Takeaway Challenge! #

## My approach ##

I prepared for the challenge by reading all of the instructions and supporting material throughly.

Following this I listed all aspects to be tested to verify I have covered them all along with any other additional notes on code I will need to use and any other requirements of my program/tests.

I then began the challenge itself by reading each of the User Stories and creating a Domain Model of each one composed of an object and a message acting on that object. These will form the basis for my unit tests and subsequently my code so that my program will be written in a test-driven manner.

For the next step I created a diagram to plot the interaction of my imagined methods and classes.

Following on from this, for each user story my approach was: run a feature test in pry to test the interaction between my objects and messages.

I used the outcome of this feature test to drive the content of my unit tests, and the subsequent outcomes/errors of these to write my code.

Using TDD I created menu, order and finally text classes, preceeded by corresponding spec files.

I then re-tested my unit and feature tests to confirm the program worked as intended.

I did this for each user story and finished by making sure my test coverage was 100% and rubocop offenses were 0. This was the case until I was alerted by GitHub that personal information was included in the text.rb file (personal phoen number).

I installed dotenv but ran into some trouble with 1 of my tests, getting the error 'Twilio::REST::RestError:
       Unable to create record: The requested resource /2010-04-01/Accounts//Messages.json was not found'.


## Contents ##

Lib folder containing:
    1. menu.rb
    2. order.rb
    3. text.rb

Spec folder containing:
    1. menu_spec.rb
    2. order_spec.rb
    3. spec_helper.rb
    4. text_spec.rb

## Authors ##

Olivia Frost

This repository was forked and then cloned from makersacademy/takeaway-challenge