TAKEAWAY CHALLENGE
=======================

## Synopsis

Project involves creating a takeaway menu of dishes and prices, to enable customers to order single or multiple dishes. Program allows customers to check that the price they expected to pay matches the total cost of the order. Customers also receive a text message confirming that their order has been placed. This text also includes information about when they can expect their order to be delivered by.



## Technologies Used

- Ruby
- Rspec

## Job List

- Menu contains a fixed list of dishes and their price (now in Order class after numerous issues having a separate menu class)
- Display contents of menu (now in Order class after numerous issues having a separate menu class)

- Place order of items (from menu) and specify the quantity of each item
- Add items in order together to create bill total
- add error message if item specified is not on menu?

- 
- Implement the ability to place orders via text message


## Still to complete/refactor
- [ ]Couldn't raise error when item wasn't in menu - couldn't seem to get them to communicate
- [ ] I wasted about 12 hours in total just trying to get my doubles working and some kind of interaction between the menu and order classes, in the end I had to combine everything into a single order class just to move forward with the project, so I hope to go back and split these back out into 2 separate classes when I understand it better and am able to do so

- [ ]
- So far there aren't many if any examples of the Single Responsibility and Dependency Injection/Inversion principles in program - apologies! TODO



USER STORIES

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


Hints on functionality to implement:

ensure you have a list of dishes with prices
place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
Use the twilio-ruby gem to access the API
Use a Gemfile to manage your gems
Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
Advanced! (have a go if you're feeling adventurous):

Implement the ability to place orders via text message.
A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.