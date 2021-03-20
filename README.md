# Takeaway

## Motivation
This is the second individual challenge set by Makers Bootcamp for the module of OOD. I worked on this task on my own using resources from the course, the Ruby and rspec documentation and my own notes.

## The Task
This is a program that simulates a takeaway service. The customers can read the menu, add items to their order and checkout, having confirmed that the total amount is correct. Here are the user stories:

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

## Edge cases
• Protect against items being ordered when they are not on the menu. • Protect against customers completing an order without having anything in their basket.

## Approach to solving the challenge
I solved this challenge using TDD, as well as the BDD cycle as guidance. Below are the steps I took:

1. I analysed the user stories and made a table representation of the objects and the messages they take (e.g. Object: Takeaway, Message: read_menu), as well as a few simple diagrams that show how the objects will use messages to communicate with one another.
2. I created feature tests using irb for each of the user stories. I also created a short script to run in the terminal, printing the return values of various methods and variables. I used that throughout the development cycle.
3. Using the failed feature tests, I wrote unit tests to reproduce the errors seen at the previous stage.
4. Letting the errors from the unit tests guide me, I implemented features until the unit tests passed.
5. I refactored my code.
6. I finally checked that the feature that I implemented satisfied the user story, before moving on to the next story.

## Assumptions
I assumed that the menu of the takeaway is not changeable. I therefore used a constant with the value of a hash containing the dishes available. I made that decision to save time and appreciate that, had this been a real-world project, it would have been discussed with the client. This design could be changed by the introduction of a MenuItems class that is initialized with the name and price of a dish. Instances of that class can then be appended to a menu array in the Menu class to create the restaurant menu, instead of the constant that is currently used.

## Progress
• I implemented the first 3 out of 4 features outlined in the user stories. I did not have the time to implement the messaging feature, as that required setting up and learning how to use the Twilio API.
• The tests passed.
• Rubocop tests did not bring up any offences.
• Test coverage of 100%.