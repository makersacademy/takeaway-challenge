Takeaway Challenge
==================
[![Build Status]()
[![Coverage Status]()

Introduction
-------
 I've been learning to program with ruby for 6 weeks now, and this was the second weekend challenge given to us by Makers Academy.

 The challenge was to create a takeaway program that uses the Twilio API to send text message confirmations on orders placed.

Task
-----

* Answer the question `What is a ruby gem? Give a code example showing how to use a ruby gem in a piece of code. What are some dangers to using a gem?`

* Write a Takeaway program with the following user stories:

User Stories
----------
```
As a customer
So that I can check if I want to order something
<!-- I would like to see a list of dishes with prices -->

As a customer
So that I can order the meal I want
<!-- I would like to be able to select some number of several available dishes -->

As a customer
So that I can verify that my order is correct
<!-- I would like to check that the total I have been given matches the sum of the various dishes in my order -->

As a customer
So that I am reassured that my order will be delivered on time
<!-- I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered -->
```
Model
-------
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

Development/Feedback
--------

Instructions
--------
First run IRB or PRY in terminal(or equivalent).
```
2.2.3 :001 > require './lib/customer.rb'
 => true
2.2.3 :002 > dan = Customer.new
 => #<Customer:0x007fbd44264680 @menu=#<Menu:0x007fbd44264658 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @basket={}, @text_provider=#<TwilioAPI:0x007fbd44264608>>
2.2.3 :003 > dan.read_menu
 => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
2.2.3 :004 > dan.add 'char sui bun', 4
 => "4x char sui bun(s) added to your basket."
2.2.3 :005 > dan.add 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :006 > dan.basket_summary
 => "char sui bun x4 = £15.96, spring roll x1 = £0.99" 
2.2.3 :007 > dan.total
 => "Total: £16.95"
2.2.3 :008 > dan.checkout(16.95)
 => "Your order has been received, you should get a confirmation text soon."
```

Author
------
Daniel St Paul
