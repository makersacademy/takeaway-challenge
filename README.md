# Takeaway Challenge

[Source](https://github.com/makersacademy/takeaway-challenge)

This is a small program to emulate a Takeaway ordering service.

The project was created in order to practice Test Driven Development and Object Oriented Principles in Ruby.

## User Stories

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices

> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes

> As a customer  
> So that I can verify that my order is correct  
> I would like to check that the total I have been given matches the sum of the various dishes in my order

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

## Technical Requirements

- All tests passing, with high test coverage.
- Clear responsibilities for each class, with short methods.
- Ensure you have a list of dishes with prices
- Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
- The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
- Use the twilio-ruby gem to access the API
- Use the Gemfile to manage your gems
- Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
- However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
- Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

Advanced! (have a go if you're feeling adventurous):

- Implement the ability to place orders via text message.
- A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

## Domain Model Diagram

| Objects | Messages |
|--|---|
| Customer |  |
| Dish | price |
| Menu | list |
| Order | total, place |

## Class Diagram

![Class Diagram][Class Diagram]

<!-- Links -->

[Class Diagram]: https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cdE9yZGVyIFwiMVwiIC0tIFwiMVwiIE1lbnUgOiBwcm92aWRlcyBhdmFpbGFibGUgZGlzaGVzXG5cdERpc2ggXCJtYW55XCIgLS0qIFwiMVwiIE1lbnUgOiBjb250YWluZWQgaW5cblx0XG5cdGNsYXNzIE9yZGVye1xuXHRcdC1tZW51OiBvYmplY3Rcblx0XHQtYmFza2V0OiBhcnJheVxuXG5cdFx0K3ZpZXdfbWVudSgpXG5cdFx0K2FkZChkaXNoKVxuXHRcdCt0b3RhbCgpXG5cdFx0K3BsYWNlKClcblx0fVxuXG5cdGNsYXNzIE1lbnV7XG5cdFx0K2Rpc2hlczogYXJyYXlcblx0XHQrdmlldygpXG5cdFx0K3Byb3ZkZV9kaXNoKClcblx0fVxuXG5cdGNsYXNzIERpc2h7XG5cdFx0K25hbWU6IHN0clxuXHRcdCtwcmljZTogaW50XG5cdH0iLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ

## Instructions

## Development Journal

### Development Approach

I approached this project using Test Driven Development strategies:

- Only write the most basic test you need to fail.
- Only write production code to pass a failing test.
- Only write the most basic production code to pass the test.

I approached this project with object oriented programming in mind:

Objects should encapsulate methods that are related to one another in purpose.
Methods should have a single responsibility, so they do not do too much, and are concise.
Objects should have their dependencies injected rather than hardcoded, so they can be tested in isolation.

In order to keep code clear and readable, I used rubocop for linting.

### Domain Model and Class Diagram

Using the user stories, I created a domain model table and a class diagram to act as a rough sketch of what the program may look like, and to help with naming variables and methods. TDD may take me in a different direction though.

### User Story 1

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.

_There should be a method to view a list of dishes with prices from the menu._

- Created menu_spec.rb and added a describe block for the Menu class, required menu.rb. Test fails.
- Created menu.rb in lib dir, and added an empty Menu class. Test passes.
- Nothing to refactor.
- Write test to expect calling #view returns a list of dishes. Test fails.
- Wrote a #view method to return a list of dishes, hardcoded. Test passes.

_As this is hardcoded at the moment it isn't very flexible, but I suspect TDD will change that soon enough._

### User Story 2

> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes

_Following the idea I had in the class diagram, this calls for an Order class, to which dishes can be added to a basket from the menu. Let's start with a basic feature test for just adding 1 pie._

- Created order_spec.rb and added a describe block for the Order class, required order.rb. Test fails.
- Created order.rb in lib dir, and added an empty Order class. Test passes.
- Wrote feature test that adding a dish to the order with #add shows that dish in the order. Test fails

_I could've tested for an array of dishes in the basket, but that would be testing state rather than behaviour!_

- Wrote #add and #basket for Order. Test passes.

_At the moment #add doesn't actually do anything, and basket just returns a hardcoded string. This will change after the next feature test though._

_Next up, a feature test for adding a pie and some mash._

