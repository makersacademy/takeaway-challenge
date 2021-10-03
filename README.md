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
 Table of Contents
-----
* [Task](#task)
* [Task Acceptance Criteria](#task-acceptance-criteria)
* [User Stories](#user-stories)
* [Installation](#installation)
* [How To Run Tests](#how-to-run-tests)
* [How To Use The Application](#how-to-use-the-application)
* [Built Using](#built-using)

Task
-----
The task for this challenge was to create a takeaway application that utilised Object Oriented Programming (OOP) through a Test Driven Development (TDD) approach. The user stories below outline the requirements for this challenge - to allow users to place an order of available dishes, check the total and receive a confirmation sms.

My approach to this challenge was to work through each individual user story, breaking each component down into the simplest requirement to create each class and method as needed, while applying the **RED, GREEN, REFACTOR** method in parallel. This method requires a test to be created initially to define what each element of the application should be doing, running the test to ensure they are failing in the intended way, then developing the feature using the test requirements. Once the feature is working correctly and the tests are passing, I then revisited my code to improve implementation and readability for better maintainability.

Task Acceptance Criteria
-----

* Create a takeaway application that allows users to create orders and receive an sms text message using the Twilio API.
* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

User Stories
-----
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
Installation
-----
* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems

How To Run Tests
-----
Once `bundle` has been ran, to test the application,

1. Open the application directory `/takeaway-challenge` using your preferred terminal 
2. Run `rspec` to see a list of tests and coverage reports.

In your terminal, you should see the below: 

```
Menu
  #initialise
    should create an empty hash to store menu items in
  #add_item
    should add a dish to the items hash
  #list_dishes
    should show a list of dishes
  #dish_available
    should return true if dish is on the menu
    should return false if dish is on the menu

Order
  #initialise
    should create an empty hash to store ordered dishes in
  #add_dish_to_order
    should add a dish to the ordered dishes hash
    should raise an error if the item is not on the menu
    #list_order
      should show a list of dishes in the order
  #calculate_total
    should calculate the total given a number of orders

SMS
  #send_sms
    should send an sms

Have you considered running rubocop? It will help you improve your code!
Try it now! Just run: rubocop

Finished in 0.27472 seconds (files took 0.16829 seconds to load)
11 examples, 0 failures


COVERAGE: 100.00% -- 92/92 lines in 6 files
```

How To Use The Application
-----
Create a Menu
```
menu = Menu.new => #<Menu:0x000000012880f448 @menu_items={}> 
```
Create an Order
```
order = Order.new => #<Order:0x000000012980d9d0 @dishes_ordered={}, @menu=#<Menu:0x000000012880f448 @menu_items={}>, @order_total=0> 
```
Add to Menu
```
menu.add_item('Steak', 18.50) => 18.5
```
Add to Order
```
order.add_dish_to_order('Steak', 2) => 2
```
List orders
```
order.calculate_total(menu) => "£37.00"
```
To send a confirmation text, set environment variables to the following:
```
ACCOUNT_SID = Your Twilio account sid
AUTH_TOKEN = Your Twilio authenication token
SENDING_NUMBER = Your Twilio number to send text messages from
```
Create an SMS instance
```
sms = SMS.new => #<SMS:0x00000001401ec058
```
Send an sms text
```
sms.send_sms('enter receiving mobile number as string')
```

Built Using
-----

* Ruby
* RSpec
* Simplecov
* Rubocop
