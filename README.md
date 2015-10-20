Takeaway Challenge
==================

You can find instructions for this project below including a full customer story.

To run this code please use IRB from the directory root.  The key commands are as follows

menu = Menu.new - creates a new empty menu
curry = Menu_item.new("curry",5) - this creates a new menu item its price is £5
menu.add_item(curry) - adds the item to the menu
menu.list_menu - lists all menu items
order = Orders.new - creates a new order
order.add_menu_item_to_order(curry) - adds the menu item curry to and order
order.total_dishes - gives the number of dishes you have ordered
order.show_order - list your order with all the order details
order.total - gives you the total amount the order will cost
order.correct - allow you to confirm that the order is correct by passing ("Yes")
order.text_order_confirmation - sends a delivery time to a mobile - currently limited to a test number

For this project I separated menus, menu items, orders and text messages into individual classes.  I have not created a default menu but rather have kept them separate from the rest of the code so that they can be developed in future in line with user's wishes.  Eventually they will need to persist as a database with linked tables to menu items.

Orders simply allow users to add menu items to the order and calculate the price from the numbers of items and the menu item price.  Customers can both check the order and conform they are happy with the price.

Once they are happy they can enter their mobile number (limited to a test number in this MVP) and receive an sms with an estimated time of delivery.

From a design approached, each order is created with a new instance of Text message that can be appended with a number and delivery time.  The order class itself "knows" nothing about texting - it simply passes a number and a message to the text class.  

The text class deals only with the interface with the twilio api and as such can be evolved separate from the rest of the code.

This project has a full set of passing code with a double for ensuring text messages are not sent every time RSPEC is run.  We have there not tested the TWILIO api itself as this is considered the responsibility of the provider.


Instructions
-------
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (if you haven't already)
* Spend an hour composing a blog post to answer the question `What is a ruby gem? Give a code example showing how to use a ruby gem in a piece of code. What are some dangers to using a gem?`
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
