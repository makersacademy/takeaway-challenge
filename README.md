# Takeaway Challenge
This is my attempt at the Makers Academy, Week 2, [Takeaway Challenge](https://github.com/makersacademy/takeaway-challenge)

## Note to reviewer
The tests for sending a text I have made pending (using ```xit```) as they need a valid mobile number to pass, but do not want texts to be sent each time the tests are run. I have tested them once each and they do send a text when a valid mobile number is given.

If you take the tests off pending then you will see that the tests fail because an invalid number is given.

You can test that sending a text works in a REPL by calling ```Order.new.confirm_order(INSERT_VALID_MOB)```.

I think the a couple of the classes could have done with some extraction but, alas, I ran out of time.

The ```Order``` class is breaking single responsibility principal since it deals with selecting dishes to add to the order and also calculating the total of the order and checking this against the user's given total. This would be interesting discussion point. Selecting a dish could have been extracted into a separate class if I had time.

Also, the ```Text``` class calculates the current time and delivery time as well as ordering the API to send the text. A separate ```DeilveryTime``` class could have been created. 

## Approach
I took a methodical approach to this challenge using TDD.

The steps took for each user story:

1. RED - Write a feature test in  ```spec/features/user_stories_spec.rb``` based on the user story given. See it fail, and then write a unit test for the relevant class to fail with the same error message.

2. GREEN - Make the feature test and unit test pass.

3. Refactor. Write further unit tests as necessary to comply with the user stories requirements and repeat RED-GREEN-REFACTOR for these tests

4. Repeat 1 to 3 for each user story.  
