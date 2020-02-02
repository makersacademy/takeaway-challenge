Takeaway Challenge
==================

The task
---------

This task is based on the Makers Academy Weekend 2 challenge [(click here for original README.md)](ORIGINAL_README.md). 

The overall objective is to create a takeaway programme in Ruby, which lets a user select the dishes they want from a menu. It then sends them an SMS message to confirm their order has been placed, using the Twilio API.

The user stories are as follows:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

How to use the program
-----

### Installing ###

1. Clone this repo to your local computer
2. Run the command gem install bundle (if you don't have bundle already)
3. Run the command 'bundle' in the project directory to ensure you have all the necessary gems

### Running ###

This programme uses Ruby. Below is an example of how to run the programme to make an order.

```
$ irb -r "./lib/order.rb"
2.6.5 :001 > menu = Menu.new({ pizza: 4, burger: 3, hot_dog: 2 })
2.6.5 :002 > order = Order.new(menu, account_sid, auth_token, from_number, to_number) # input the relevant details for arguments 2 to 5.
2.6.5 :003 > order.add("pizza", 2)
2.6.5 :004 > order.add("burger", 3)
2.6.5 :005 > order.remove("burger", 1)
2.6.5 :006 > order.summary
2.6.5 :007 > order.pay(14)
```
Upon paying the correct amount (as per the last line), you will receive a confirmation text stating when you can expect your delivery.
Thank you for ordering with Jasiveroo!

Structure
-----
As part of the planning process, I identified the classes that I would need, along with the attributes and methods of each.


I then built each in turn, starting with those which did not depend on any other classes, making my way up to those which had multiple dependencies.


| Object: | Menu |
| ------- | ------- |
| **Attributes:** | dishes |
| **Methods:** | print, search |










* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

## Features to be added ##

In the future, I would like to implement the following features:
- More extensive use of doubles to further isolate separate class testing
- Use of environment variables to facilitate keeping private information secret
- More extensive testing of the code that relies on the Twilio gem
- The ability to place orders via text message.
