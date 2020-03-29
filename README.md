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

Advanced:

- Implement the ability to place orders via text message.

## Models

These diagrams were created in the planning phase, but due to developing with TDD and allowing the program to emerge from that process, They are slightly different from the final product.

### Domain Model Table

| Objects | Messages |
|--|---|
| Customer |  |
| Dish | price |
| Menu | list |
| Order | total, place |

### Class Diagram

![Class Diagram][Class Diagram]

## Instructions

### Install dependencies

- This program uses several gems to work properly. 
  Install them from a terminal in the main directory with: 

  ```bash
  bundle
  ```

### Set up Notification file

- You will need your own [Twilio account](https://www.twilio.com/) in order to set up this configuration.
- Make a copy of notification_template.rb called notification.rb, from a terminal in the main directory with:

  ```bash
  cp ./lib/notification_template.rb ./lib/fart.rb
  ```

- In your new notification.rb file replace the following fields with your Twilio credentials and phone numbers:

  ```ruby
  ACCOUNT_SID = 'xxxxxxxxxxxxxxxxxxx'
  AUTH_TOKEN = 'xxxxxxxxxxxxxxxxxxx'

  FROM = '+111111111111' # Your Twilio number
  TO = '+111111111111' # Your mobile phone number
  ```

- Don't worry, notification.rb is included in the gitignore file, so even if you push your local repo to an online repo your credentials will not be made public.

### Enter REPL

- Enter your REPL of choice, I use IRB.  
  From terminal in the main directory: 

  ```bash
  irb
  ```

- Load in order.rb:

  ```ruby
  require './lib/order.rb'
  ```

### Instantiate an Order

- Instantiate an order:

  ```ruby
  my_order = Order
  ```

### Viewing the menu

- View the menu with the Order view_menu method:

  ```ruby
  my_order.view_menu
  ```

### Adding dishes to your order

- Add dishes to your order with the Order add method, passing in the menu number of the dish you want:

  ```ruby
  my_order.add(1)
  ```

- Attempting to add a dish number that isn't on the menu will result in an error:

  ```ruby
  my_order.add(50)
  ```

  > RuntimeError (That number isn't an item on the menu)

### View your basket

- View the dishes in your basket and the total price with the Order basket method:

  ```ruby
  my_order.add(1)
  my_order.basket
  ```

### Place your order

- Place your order with the Order place method:

  ```ruby
  my_order.add(1)
  my_order.place
  ```

  You will receive a text message to let you know your order is on its way

  > Thank you! Your order was placed and will be delivered before 17:30

- Attempting to place an order without adding anything to the basket will raise an error:

  ```ruby
  my_order.place
  ```

  > RuntimeError (Cannot place order with an empty basket)

## Development Journal

### Development Approach

I approached this project using Test Driven Development strategies:

- Only write the most basic test you need to fail.
- Only write production code to pass a failing test.
- Only write the most basic production code to pass the test.

I approached this project with object oriented programming in mind:

- Objects should encapsulate methods that are related to one another in purpose.
- Methods should have a single responsibility, so they do not do too much, and are concise.
- Objects should have their dependencies injected rather than hardcoded, so they can be tested in isolation.

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

_Turns out I did have time! Read on for the finished version of the slightly wrong implementation or [skip to the implementation of the actual requirements](#solving-the-correct-requirements)._

### User Story 4

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

This user story requires that I send text messages with Twilio. I've added it to the Gemfile, so now all I need to do is run `bundle` from the terminal to get everything installed.

I also need to inject the notification type into the order so I can test without Twilio constantly texting me.

- Created a mock notification instance, allowing the mock to receive send and return the string with the time an hour from now, using a double for the current time now plus 1 hour converted to a 24h format (hh:mm)

- Wrote a test to check that placing an order returns a string thanking you for that order with the correct time (hour from now), using the mock. Test red.

- Added an additional parameter to #initialize to inject the notification instance double, defaulting to a new instance of the Notification class. This is stored in an instance variable.

- Added #place, with a variable order_time assigned with the time now, and then calling place delegates to the notification instance to send. There isn't one yet so time to make one.

  - Set up tests for Notification in notification_spec.rb, with a mock of the Twilio SMS client to stop these tests actually sending me texts.

  - #send should send a message with the passed delivery time. Test red.

  - Wrote #send to accept a time as argument and call the SMS client messages to create a message. Test green.

- Now the Notification class is complete. #place tests are green.

### Manual Feature testing and Refactoring

Upon testing in IRB there needs to be some changes made. There needs to be a way to view the menu by interacting with an instance of Order.

- Wrote a test in order_spec.rb for #view_menu to return the list of dishes from the menu. Test red.

- Wrote #view_menu to call #view on the menu in the instance variable. Test green.

Manual testing reveals that the SMS notification works, but the time is incorrectly formatted. I see that I was sidetracked by setting up the Notification#send and I neglected to format the passed delivery time, or refactor Order#place.

- Corrected notification mock to expect a 24h time using regex, test red.

- Updated #place to pass 24h time to #send, test green.

- Refactored #place to use private helper method #calculate_delivery_time, and a constant ONE_HOUR to remove the 60 * 60 magic number for calculating the delivery time, and also #time_as_24 to provide a 24h format. Tests still green.

Manual testing reveals it is possible to place an order with an empty basket. This is an edge case and should return an error.

- Wrote test to expect an error to be raised if attempting to place an order with nothing in the basket. Test red.

- Added guard clause to #place to raise error if basket size is 0. Test green.

- Refactored to move guard clause to #check_basket

### Solving the correct requirements

So, previously I had implemented a slightly different solution, with separate methods to add items and place the order. This didn't match the requirements, which are to provide a single method that accepts a series of arguments: a list of dishes, their quantities and a number that should be the exact total.

### User Stories 2 and 3

> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes

> As a customer  
> So that I can verify that my order is correct  
> I would like to check that the total I have been given matches the sum of the various dishes in my order

This user story is partway implemented, the menu can return dishes when prompted. Now there needs to be a place method that accepts:

- the series of dishes
- their quantities
- a number that should be the exact total

And returns true or false based on if the number is the exact total of the sum of the price of the dishes ordered.

- Wrote test for #place in order_spec.rb to return true if passed: "pie", 1, 6. Test red.

- Wrote #place to accept three arguments and return true. Test green.

- Wrote test for #place to return false if passed: "pie", 1, 4. Test red.

  - In order to pass this test I did some slight refactoring of the dishes hash to use a string (i.e. "pie") as a key, rather than a number.

- In #place I used menu#provide_dish to get the dish, and set a variable price with that dish's #price method. Then return a comparison between the passed total and the actual price. Test green.

- Wrote test for #place to return true if passed: "pie", 1, "mash", 1, 10. Test red.

- Updated #place to take a variable length argument dish_list. Added variables:
  - dishes assigned by filtering the strings from dish_list
  - quantities assigned by filtering the integers from dish_list
  - actual_total assigned by mapping through dishes and getting the price of each item from menu

- Finally, return comparison of actual_total and total passed in. Test green.

- Refactoring, it appears that @menu.provide_dish(dish).price should just be something that we could ask the menu for, like @menu.provide_price(dish). Added that method to menu.

- Also extracted some private helper methods from #place: #get_dishes, #get_quantities and #total_price. Tests still green.

- Wrote test for #place to return true if passed: "pie", 2, "mash", 1, 16. Test red.

- Updated #total_price to take both dishes and quantities as arguments. Variable prices maps through dishes and asks the menu to provide the price for that dish. Totals are calculated by zipping the prices with quantities to create a 2d array of the price of each item and how many there are. Then mapping through that array and multiplying each subarray's values together results in an array of subtotals. Finally, sum the subtotal array. Test green.

- For my own sanity wrote a test for #place to return true if passed: "pie", 40, "mash", 12, "chips", 7, 323

- Wrote test for edge case of passing arguments missing a quantity to #place. Test red.

- Added guard clause to #place to raise error if the size of the dishes array is not equal to size of the quantities array. Test green.

- Refactored the guard clause out to a helper method #check_order.

### User Story 4

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

Assuming the order is entered correctly, the user should receive a text.

- Wrote a test that a correct order will cause the notification instance to receive a send message. Test red.

- Reintroduced the methods #calculate_delivery_time, #time_as_24, and added code to #place from the old #place method that sends a notification with the correctly formatted delivery time. Test green.

- Refactored this out to #send_notification

### Reflections

I feel I have implemented a good solution, with good test coverage, and fully isolated tests.

I feel I have done a good job of using OO principles of Encapsulation, SRP and Dependency Injection.

I did try my best to follow TDD practices but at times I got sidetracked with unrelated features, but eventually got back on track.

I feel a little bit silly for not understanding the requirements quite correctly, however I think I have achieved the learning objectives of practising TDD, OOP, and gem usage well in any case.

I may come back to implement a "technically correct" solution in the future.

<!-- Links -->

[Class Diagram]: https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cdE9yZGVyIFwiMVwiIC0tIFwiMVwiIE1lbnUgOiBwcm92aWRlcyBhdmFpbGFibGUgZGlzaGVzXG5cdERpc2ggXCJtYW55XCIgLS0qIFwiMVwiIE1lbnUgOiBjb250YWluZWQgaW5cblx0XG5cdGNsYXNzIE9yZGVye1xuXHRcdC1tZW51OiBvYmplY3Rcblx0XHQtYmFza2V0OiBhcnJheVxuXG5cdFx0K3ZpZXdfbWVudSgpXG5cdFx0K2FkZChkaXNoKVxuXHRcdCt0b3RhbCgpXG5cdFx0K3BsYWNlKClcblx0fVxuXG5cdGNsYXNzIE1lbnV7XG5cdFx0K2Rpc2hlczogYXJyYXlcblx0XHQrdmlldygpXG5cdFx0K3Byb3ZkZV9kaXNoKClcblx0fVxuXG5cdGNsYXNzIERpc2h7XG5cdFx0K25hbWU6IHN0clxuXHRcdCtwcmljZTogaW50XG5cdH0iLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ
