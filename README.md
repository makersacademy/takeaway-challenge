[![Build Status](https://travis-ci.org/DeathRay1977/takeaway-challenge.svg)](https://travis-ci.org/DeathRay1977/takeaway-challenge)

Takeaway Challenge
==================

My Approach
-----------

I was listening to a talk by Sandi Metz this week about how to write better software using OO. Her simple advice was to "Build smaller objects". Looking at the problem the first time around, I indentified some nouns that might be classes in the application. The early analysis revealed the following potential classes:

* Menu
* Order
* Dish
* Customer
* Takeaway

The Customer class was too broad and outside the scope of this brief. The Takeaway class is the interface class that brings all the other classes together. It's a bit of a God class but there has to be somewhere wherte the rest of the classes come together?

Looking more closely at the other three classes, I tried to identify the verbs that might throw some light on the methods/responsibilies they might have?

* Takeaway
 * Present customer with menu and allow them to choose
 * Add items to an order
 * Verify order total
 * Notify customer
* Menu
  * Provide/Load the list of dishes
  * Allow a user to choose a dish
  * Print the menu to the screen
* Order
  * Pick from Menu and Add item to an order
  * Calculate total
* Dish
  * A simple class to encapsulate a dish with Description and Price.

It seemed to me that the classes Takeaway, Order and Menu violate the Single Responsibility Principle in as much as the Takeaway class used the other classes and also notified customers. To make this better, I extracted a Notifier class. The Menu class was responsible for handling the printing of dishes, allowing custmers to choose a dish as well as loading data of all available dishes. I didn't want to hard code the list of dishes and wanted a more dynamic way of loading data. I decided on a simple MenuLoader class that will load dishes into objects of the Dish class from a YAML file. It might be overkill for this challenge and it definitely wasn't part of the brief. I wanted to decouple the loading of data from the Menu class. MenuLoader could just as easily have contained a hash of dishes that was hard coded. The Open/Closed principle came into play here. If I hard coded the values, the class would not have been open to change but closed to modification. I could have also extracted a class for menu printing but decided against it as I was running out of time.

The Order class was doing more than one thing. I was looking after adding things to the order and calculating the total. I decided to extract a OrderTotal class to calculate the total.

The new Notifier class in itself was doing two things. Calling the Twilio API to send SMS messages and looking after the coinfiguration details for that task. I therefore decided to extract a class that looks after the Account SID and Auth Token in a configuration file. Again, maybe a bit of overkill but it separated the responsibilities and made the design adhere more to Open/Closed.

In the end, I had come up with 8 classes:

* Menu
* MenuLoader
* Order
* OrderTotal
* Notifier
* ConfigLoader
* Takeaway
* Dish

Next I looked at the dependencies between the classes. It seemed to me that there were a lot! To reduce this as much as possible, I used Dependency Injection wherever possible. A diagram that shows the classes and how they depend on each other and how they have been injected can be found here. 



If I had more time, I would probably refactor the Takeaway class to provide a build method to build all its dependencies. 

https://www.lucidchart.com/invitations/accept/47cae47d-7623-4faf-addd-1cf7fbfe2a9c

Instructions
-------

* Instantiate the Takeaway object as follows:

    t= Takeaway.new(menu_klass: Menu, 
                    menu_loader_klass: MenuLoader, 
                    order_klass: Order,                             
                    notifier_klass: Notifier, 
                    config_loader_klass: ConfigLoader, 
                    delivery_estimator_klass: DeliveryEstimator,            
                    order_total_klass: OrderTotal)
                 
 
 Once the takeaway Object has been created, the following methods are available.
 
 * print_menu - Print the menu to the screen.
 * pick_item - Pick an item from the menu.
 * add_to_order - Add the item to the order.
 * verify_total - Verify the total against estimate.
 * notifiy - notify customer delivery in an hour.


* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_october2015 (if you haven't already)
* Fork this repo
* run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

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

* Hints on functionality to implement:
  * ensure you have a list of dishes with prices
  * place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use a Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


**Note: We are looking for good OO design and programming! Remember the Single Responsibility and Dependency Injection/Inversion principles!**

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)
