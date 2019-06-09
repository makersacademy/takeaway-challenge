# :ramen: Takeaway Challenge :ramen:

A command line takeaway app.

## Approach 

* Created a Menu class, which is responsible containing the dishes with prices in a hash. 
* Implemented a method to view the menu. 
* Added a Order class, to allow the user to store the selected dishes in a hash.
* Added a method to check the total order
* Created a class to send a confirmation messages using Twilio API, worked perfectly when I hardcoded the phone numbers, after implementing the dotenv gem, can't receive text messages. Due to time constrains couldn't fix it. 


## Challenges

* Encapsulation
* RSpec doubles
* Abstraction
* Dependency Injection
* Sending messages using Twilio API, didn't have to fix the issues with environment variables. 
* Dotenv gem is not working yet, have to figure out how to read them from .env
* All tests passing
* Keep my private information secret with environment variables.

## Run the program

* Clone this repo to your local machine
* Run the command gem install bundle (if you don't have bundle already)
* When the installation completes, run bundle to install all the required gems
* Run ``irb`` in terminal 
* ``require './lib/takeaway ``
* Create a new menu object ``menu = Menu.new() ``
* Create a new takeaway object ``takeaway = TakeAway.new(menu)`` 


## Functionality to implement

* Ensure you have a list of dishes with prices
* Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. “Thank you! Your order was placed and will be delivered before 18:52”.
* The text sending functionality should be implemented using Twilio API. You’ll need to register for it. It’s free.
* Use the twilio-ruby gem to access the API
* Use the Gemfile to manage your gems
* Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
* However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
* Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.
* Advanced
	* Implement the ability to place orders via text message.
  

## User Stories

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