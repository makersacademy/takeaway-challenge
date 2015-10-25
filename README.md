Takeaway Challenge [![Build Status](https://travis-ci.org/hsheikhm/takeaway-challenge.svg?branch=master)](https://travis-ci.org/hsheikhm/takeaway-challenge) [![Coverage Status](https://coveralls.io/repos/hsheikhm/takeaway-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/hsheikhm/takeaway-challenge?branch=master)
==================

* [Task](#task)
* [My Approach](#my-approach)
* [Feature Test Sample](#feature-test-sample)

Task
-----
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

My Approach
------------

I started by playing around with the feature tests to understand what objects and methods would need to be created. This helped me to put together a **Domain Model** that I could work from. I then started to write some actual production code so that I could work out how the classes would interact with each other. Once I was happy with what needed to be done I then deleted all my production code and started writing my unit tests. I naturally stuck to the **Red-Green-Refactor** process. After making all my unit tests pass I then started to write the actual code.

The main principles that I wanted to draw upon were those of **Single Responsibility Principle (SRP)** and **Dependency Injection (DI)**. In order to use SRP I made sure to structure my code in 4 separate classes with each having its own responsibility. This naturally made my testing easier and my code easier to read. As for DI, you will see that I had incorporated this into my Takeaway class within the *initialize* method. As a result I was able to use the London Style (as opposed to Chicago Style) when it came to my RSpec testing since I could use doubles to represent my other class objects. This allowed all my unit tests to become isolated.

To create the text message function I used the **Twilio API**.

To carry out SRP I had decided to create 4 separate classes:

* [Takeaway](https://github.com/hsheikhm/takeaway-challenge/blob/master/lib/takeaway.rb) (User interaction, delegating responsibilities to other classes, and raising errors where relevant)
* [Order](https://github.com/hsheikhm/takeaway-challenge/blob/master/lib/order.rb) (Responsible for creating new orders, adding items to basket, calculating final costs)
* [Menu](https://github.com/hsheikhm/takeaway-challenge/blob/master/lib/menu.rb) (To list all dishes and prices)
* [TextMessenger](https://github.com/hsheikhm/takeaway-challenge/blob/master/lib/textmessenger.rb) (Responsible for sending the text message to user)

Below is my directory tree structure:
```
lib/
    - menu.rb
    - order.rb
    - takeaway.rb
    - textmessenger.rb
spec/
    - menu_spec.rb
    - order_spec.rb
    - spec_helper.rb
    - takeaway_spec.rb
    - textmessenger_spec.rb
```

Feature Test Sample
--------------------
***New Takeaway Object:***
```
2.2.3 :001 > takeaway = Takeaway.new
```
***User can see the menu:***
```
2.2.3 :002 > takeaway.read_menu
 => {"Spring Roll"=>0.99, "Fried Prawn"=>2.99, "Egg Fried Rice"=>1.99, "Prawn Cracker"=>0.79, "Sweet and Sour Fish"=>3.99, "Chilli Chicken"=>4.99, "Noodle Soup"=>2.99}
```
***User can place an order and specify quantity:***
```
2.2.3 :003 > takeaway.place_order("Spring Roll", 2)
 => "2x Spring Roll(s) added to your basket."
2.2.3 :004 > takeaway.place_order("Egg Fried Rice", 5)
 => "5x Egg Fried Rice(s) added to your basket."
```
***User can see their shopping basket:***
```
2.2.3 :005 > takeaway.basket_summary
Spring Roll x2 = £1.98, Egg Fried Rice x5 = £9.95
```
***User can see the total cost:***
```
2.2.3 :006 > takeaway.total_cost
 => "Total Cost: £11.93"
```
***User can checkout their order and will receive SMS confirmation:***
```
2.2.3 :007 > takeaway.checkout(11.93)
 => "You will shortly receive an SMS confirming your order."
```

Author: [Hamza Sheikh](https://github.com/hsheikhm)
