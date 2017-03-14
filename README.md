# Takeaway Challenge
### Makers Academy Weekend Challenge No.2

[![Build Status](https://travis-ci.org/KatHicks/takeaway-challenge.svg?branch=master)](https://travis-ci.org/KatHicks/takeaway-challenge) [![Coverage Status](https://coveralls.io/repos/github/KatHicks/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/KatHicks/takeaway-challenge?branch=master) [![Code Climate](https://codeclimate.com/github/KatHicks/takeaway-challenge/badges/gpa.svg)](https://codeclimate.com/github/KatHicks/takeaway-challenge)

### Instructions

We were given from the end of the day on Friday until 9am on Monday to complete the challenge.

Decided to significantly refactor my tests following the code review and a workshop on doubles so that my unit testing follows the London-School of testing.

### Task

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

* Ensure you have a list of dishes with prices
* Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
* The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
* Use the twilio-ruby gem to access the API
* Use the Gemfile to manage your gems
* Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
* However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
* Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

You can see the full task and instructions given to us in [CONTRIBUTING.md](takeaway-challenge/CONTRIBUTING.md).

### Using my application

```
2.3.1 :001 > require './lib/takeaway.rb'
 => true
2.3.1 :002 > zizzi = Takeaway.new
 => #<Takeaway:0x007f8bc1939d20 @menu=#<Menu:0x007f8bc1939cf8 @list=[#<Dish:0x007f8bc12376a8 @name="Margherita Pizza", @price=8.45>, #<Dish:0x007f8bc12371f8 @name="Spaghetti Carbonara", @price=10.75>, #<Dish:0x007f8bc1236b18 @name="Calzone", @price=12.45>, #<Dish:0x007f8bc1236398 @name="Spaghetti Bolognese", @price=9.95>, #<Dish:0x007f8bc1235e70 @name="Caprese Salad", @price=4.35>, #<Dish:0x007f8bc1235998 @name="King Prawn Linguine", @price=12.95>, #<Dish:0x007f8bc122ef58 @name="Italian Hot Pizza", @price=10.25>, #<Dish:0x007f8bc122ea58 @name="Chicken Ceasar Salar", @price=10.5>, #<Dish:0x007f8bc122e558 @name="Lasagne", @price=10.95>, #<Dish:0x007f8bc122df68 @name="Mushroom Risotto", @price=11.95>, #<Dish:0x007f8bc122d5b8 @name="Penne Arrabbiata", @price=9.95>, #<Dish:0x007f8bc122d0e0 @name="Salad Nicoise", @price=5.65>]>, @basket=nil>
2.3.1 :003 > zizzi.see_menu
 => "Margherita Pizza (£8.45); Spaghetti Carbonara (£10.75); Calzone (£12.45); Spaghetti Bolognese (£9.95); Caprese Salad (£4.35); King Prawn Linguine (£12.95); Italian Hot Pizza (£10.25); Chicken Ceasar Salar (£10.5); Lasagne (£10.95); Mushroom Risotto (£11.95); Penne Arrabbiata (£9.95); Salad Nicoise (£5.65)"
2.3.1 :004 > zizzi.select_dishes("Lasagne", "Mushroom Risotto", 2)
 => nil
2.3.1 :005 > zizzi.view_order
 => "Lasagne (£10.95); Mushroom Risotto (£11.95)"
2.3.1 :006 > zizzi.place_order
 => nil
 ```

### Dependencies

* Written in **Ruby 2.3.1**
* Tested using **RSpec** (for unit testing)
* Place order functionality uses Twilio API (using **Twilio-Ruby 4.11.1**)

### Steps in my development process

* **Developing a domain model**
  * Read through the user stories and developed my domain model

* **Building the first feature**
  * Started with tackling the first user story of seeing a list of dishes
    * Wrote feature test in RSpec in userstories_spec.rb and then write a unit test asking for a menu class
    * Created a menu class and wrote a method inside of it called see_dishes

* **Building the second feature**
  * Moved on to dealing with the second user story and developed a method called select_dishes

* **Building the third feature**
  * Tackled the third user story for checking that the total is correct.
    * At this stage, created an order object with select dishes as an instance array
    * Check method then checks that the length of the array (i.e. the number of selected dishes) is as expected

* **Refactoring to create a dish class**
  * Now that my first three user stories have been met in the most simple way possible, I've decided to extend my code so that the design is more in line with my original domain model.
    * Created a dish class so that they can be injected in to the menu list
    * Here my development is less test-driven but unit tests are added to validate the added code

* **Refactoring tests**
  * Next decided to refactor tests so that they are more readable - in particularly changed all spec files to use named subjects

* **Integrating Travis CI and Coveralls**
  * Refreshed my repositories on Travis CI and Coveralls and turned on testing for this repo on both.
  * Added Travis and Coveralls status badges to README.md

* **Building the final feature using Twilio**
  * Signed up to Twilio and installed Twilio Gem
  * Added gem to Gemfile so that dependency is tracked for other users of my code
  * I've now been able to implement the Twilio API to send a text on order.
    * Note that this functionality was added in to the order class and select_dishes delegates confirming the order to the order class

* **Added an exception to select_dishes**
  * Now that all the features/user stories have technically been satisfied, I've moved onto extending the code based on the additional hints and tips (see README.md)
  * Added an exception to the select_dishes method based on the check method - so that if the number of selected dishes is not the same total quantity as the user expected (based on the method arguments), then an error is raised.
  * Adding this feature meant that some refactoring of the tests was needed to take into account the new argument required in the select_dishes method

* **Extending confirmation text to use time stamp**
  * I'm now moving on to further extending my code beyond that exactly specified in the user stories. It is a good learning opportunity for me to try new things out based on my ideas.
  * Required the ruby time module into the order class and added a time-stamp of when the order was placed to the confirmation text

* **Extending menu list to load from a CSV**
  * Again, it didn't seem very DRY for the menu instance variable to by a long array. If the menu was the length of a normal menu this would be very repetitive at the top of the menu class.
  * Decided to implement so that the instance variable loads on initialisation of the menu class from a csv of dishes and their prices. A new dish object is created on instantiation of menu for each row in the csv.

* **Extending tests to use stubs and doubles**
  * Currently, my test coverage (although high according to Coveralls) is not very sophisticated and is not using doubles as specified in the additional hints and tips in the instructions.
  * I'm now going to extend my tests to make sure that my entire programme is working exactly as expected.


### Ideas for extension

Below is a list of ideas that would have been nice to implement with more time:
* **Stubbing twilio in Rspec**
  * Key area that would like to develop is to improve my mocking of the SMS class to make better use of stubs and increase the test coverage in this class
* **Using keyword arguments in select_dishes**
  * Currently, variable quantities for selected dishes is not possible. If you wanted to order three of the same dish, you'd just have to write it out three times.
  * Using keyword arguments along with the splat operator, should allow users to interact with the programme this way.
  * It is suggested that this sort of functionality should be implemented in the additional hints and tips
