#Takeaway Challenge#

[![Build Status](https://travis-ci.org/RBGeomaticsRob/takeaway-challenge.svg)](https://travis-ci.org/RBGeomaticsRob/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/RBGeomaticsRob/takeaway-challenge/badge.svg)](https://coveralls.io/r/RBGeomaticsRob/takeaway-challenge)

##Task##

This is the end of the second week challenge at Makers Academy, it will be developed in a test driven approach with a focus on good OO design, including a focus on SOLID principles.

##User Stories##
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

##MVP Roadmap##
Extracted prototype road map to provide focus and clarity on development steps from the user stories.
```
MVp1 - User can check menu, place an order for it, check the order totals before purchase, confirm order and recieve a text to say it is on-route.

MVp2 - User can see a dish, place *multiple orders* for it, check that the total price equals the *combined price of the dishes*, confirm order and recieve a text to say it is on-route.

MVp3 - User can see a *multiple dishes*, place multiple orders for them, check that the total price equals the combined price of the dishes, confirm order and recieve a text to say it is on-route.
```

##Domain Design##

This project is being developed in a BDD approach and therefore the domain design below will grow and

- Menu - Responsibility Holding the menu items
- Order - Responsibility collating order
- Purchase - Responsible with proceeding with the order
- Customer -
- Interaction - Responsible for capturing user input
- Confirmation - Responsible for Texting Confirmation to the purchaser



* Hints on functionality to implement:
  * ensure you have a list of dishes with prices
  * place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use a Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


**Note: We are looking for good OO design and programming! Remember the Single Responsibility and Dependency Injection/Inversion principles!**
