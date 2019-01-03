Takeaway Challenge
==================

```
First diagram
```
![Image-of-application](https://github.com/AlinaGoaga/takeaway-challenge/blob/master/draft.jpg)

```
Final diagram
```
![Image-of-application](https://github.com/AlinaGoaga/takeaway-challenge/blob/master/final.jpg)

```
Code
```
The code is structured in 5 classes: Takeaway (main class), Order, Menu, User_input (to get the user preferences for the order) and Message (for the notification the user gets once the order has been placed) 

The main class allows the user to see the menu, add items to the order (delegated to the User_Input and Order classes) and see the total to pay (again delegated to Order). It also delegates the sending of confirmation messages to the Messages class which performs the action via the Twilio API.

To run the application: 
- clone the repository
- cd into takeaway-challenge
- run bundle
- start irb and require './lib/takeaway.rb'

When running the application in IRB an actual message will be generated. For any other tests that has been mocked.

```
Tests
```
- used rspec to write unit tests
- classes being test in isolation with the help of doubles
- to run tests simply run rspec in the main project folder 

```
Application in irb
```
![Image-of-application](https://github.com/AlinaGoaga/takeaway-challenge/blob/master/irb_takeaway.jpeg)

