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

- Created menu_spec.rb and added a describe block for the Menu class, required menu.rb. Test red.
- Created menu.rb in lib dir, and added an empty Menu class. Test green.
- Nothing to refactor.
- Write test to expect calling #view returns a list of dishes. Test red.
- Wrote a #view method to return a list of dishes, hardcoded. Test green.

_As this is hardcoded at the moment it isn't very flexible, but I suspect TDD will change that soon enough._

### User Story 2

> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes

_Following the idea I had in the class diagram, this calls for an Order class, to which dishes can be added to a basket from the menu. Let's start with a basic feature test for just adding 1 pie._

- Created order_spec.rb and added a describe block for the Order class, required order.rb. Test red.

- Created order.rb in lib dir, and added an empty Order class. Test green.

- No refactor needed.

- Wrote feature test that adding a dish to the order with #add shows that dish in the order. Test red.

_I could've tested for an array of dishes in the basket, but that would be testing state rather than behaviour!_

- Wrote #add and #basket for Order. Test green.

- No refactor needed yet.

_At the moment #add doesn't actually do anything, and basket just returns a hardcoded string. This will change after the next feature test though._

_Next up, a feature test for adding a pie and some mash._

- Wrote feature test that adding two dishes to the order shows both in the order basket. Test red.

_At this point I realised I had been passing in doubles of pies and mash to #add. That's not what a user would do! I refactored the tests to add took a number as a parameter, the number of the dish on the menu. The tests still work as they did before._

_To pass this feature test there needs to be several units tested and implemented. The Menu has responsibility to pass back dishes the order requests._

- Wrote unit test for Menu #provide_dish to return a Pie object when passed 1. Test red.

  - Pie is an uninitialized constant, so wrote tests in pie_spec.rb for Pie#name to be "Pie" and Pie#price to be 6. tests red. 

  - Created pie.rb and added a Pie class, tests green.

- Wrote #provide_dish to return Pie.new. Test green.

- Wrote unit test for Menu #provide_dish to return a Mash object when passed 2. Test red.

  - Mash is an uninitialized constant, wrote similar tests to Pie for Mash in mash_spec.rb, tests red.

  - Created mash.rb and added a Mash class, tests green.
- Wrote an if-else in #provide_dish to pass a Pie if 1 else Mash. Test green.

- Wrote unit test for Menu #provide_dish to return a Chips object when passed 3. Test red.

  - Chips is an uninitialized constant, wrote similar tests to Pie and Mash for Chips in chips_spec.rb, tests red.

  - Created chips.rb and added a Chips class, tests green.

- Extended the if-else in #provide_dish to pass a Chips if 1, Mash if 2, else Chips. Test green.

- Wrote a test for #provide_dish to raise error if passed a menu item number that doesn't exist. Tests red.

- Extended the if-else to cover cases 1, 2, 3 and on else raise an error. Test green.

_This is a functional solution, but it is fragile, adding more dishes to the menu is hard, needing to add to an ever growing if-else for each dish. Time to refactor._

- Created a constant DISHES, a frozen hash containing keys for the dish numbers and values for the dish objects.

- Created #check_in_menu to raise the error if the number passed is not a key in DISHES.

- Created #get_dish which returns the dish class for the passed number in DISHES.

- Refactored #provide_dish to first check with #check_in_menu, then return a new instance of the desired dish from the dish returned from #get_dish.

- Also added a constant MENU_LENGTH as the size of DISHES, and used that in the test for a number outside the menu so even if the menu expands the test will still be green.

_Now that we have flexibility with the menu items we can add dishes easily, but the view method is still hardcoded. Testing this will require some dependency injection. I plan to inject a hash of doubled dish classes._

- Wrote a new #view test expecting only 1 item when creating a menu with only one dish in the dish hash. Test red.

- As now a dish hash is injected the dish hash, the Class constants are replaced with instance variables, so different dishes hashes can be injected in an instance to instance basis.

- Added a parameter of dishes to the initialize method, defaulting to a hash of real dish classes.

- Instance variables dishes and menu_length are set up based on the passed dish hash.

- Altered #view to map through the dishes hash, and delegate to each dish classes to return its name and price with #details.

  _Each of the dish classes needs a #details method. Given that I want all of the dishes to do this, rather than adding this to all of the individual dish classes, I'll create a superclass Dish they can all inherit from._

  - Created Dish in dish.rb and moved attr_readers from sub-classes to Dish, and added #details to return a nice string with the name and price in parentheses.

  - Updated Pie, Mash and Chips to inherit Dish. Now they will all be able to use #details. All dish tests still green.

  - Updated the doubles used in the menu tests, as they need to be able to respond to #details.

- #view expecting only 1 item now tests green.
- Wrote a couple more tests for #view for injected dish hashes with 2 and 3 dishes to rule out false positives, they are green.

_In retrospect I realise that updating the view method to work dynamically with any dish hash was not contributing to the completion of the user story feature, and didn't help the test pass, so it was bad TDD. However it was good practice for dependency injection. On with the user story and the two dishes in the basket feature test._

_#add needs to actually start doing something, and #basket needs to return the things that have been added. As the responsibility for returning the dishes an Order is told to add lies with a Menu, a Menu needs to be mocked._

- Added mocks to the tests for #add and #basket to be injected into Order construction. Test red.

- Order is now initializing with an argument, so added this parameter defaulting to a Menu instance.

- Also added an instance variable @baskets as an empty array to initialize.

- Wrote #add to ask the call provide_dish on the menu and push the result onto the basket array.

- Wrote #basket to with several variables:
  - header assigned with a string "Your order:\n"
  - list assigned by mapping through basket asking each dish for its detail, the array joined with "\n"
  - total assigned by mapping through basket asking each dish for its price and summing that array
  - footer assigned with a string interpolating total: "\nTotal: £#{total}"
  - finally returning header, list and footer concatenated.

- Adding two items test is now green.

- Refactored some of the lines out of #basket to helper methods #total, #basket_list, and a constant BASKET_HEADER.

- #basket is much simpler now, tests still green.

### User Story 3

> As a customer  
> So that I can verify that my order is correct  
> I would like to check that the total I have been given matches the sum of the various dishes in my order

It looks like this one is actually already complete having already implemented #basket in order to test behaviour rather than state, nice!

_Uh oh! in retrospect, looking at the technical requirements I think I have implemented a slightly different requirement that the one asked for. Oops! I'll continue with my implementation and later on if I have time I'll come back and do it to the letter of the technical requirements._

#### User Story 4

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

This user story requires that I send text messages with Twilio. I've added it to the Gemfile, so now all I need to do is run `bundle` from the terminal to get everything installed.



<!-- Links -->

[Class Diagram]: https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cdE9yZGVyIFwiMVwiIC0tIFwiMVwiIE1lbnUgOiBwcm92aWRlcyBhdmFpbGFibGUgZGlzaGVzXG5cdERpc2ggXCJtYW55XCIgLS0qIFwiMVwiIE1lbnUgOiBjb250YWluZWQgaW5cblx0XG5cdGNsYXNzIE9yZGVye1xuXHRcdC1tZW51OiBvYmplY3Rcblx0XHQtYmFza2V0OiBhcnJheVxuXG5cdFx0K3ZpZXdfbWVudSgpXG5cdFx0K2FkZChkaXNoKVxuXHRcdCt0b3RhbCgpXG5cdFx0K3BsYWNlKClcblx0fVxuXG5cdGNsYXNzIE1lbnV7XG5cdFx0K2Rpc2hlczogYXJyYXlcblx0XHQrdmlldygpXG5cdFx0K3Byb3ZkZV9kaXNoKClcblx0fVxuXG5cdGNsYXNzIERpc2h7XG5cdFx0K25hbWU6IHN0clxuXHRcdCtwcmljZTogaW50XG5cdH0iLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ
