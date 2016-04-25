Takeaway Challenge
==================

[![Build Status](https://travis-ci.org/festinalent3/takeaway-challenge.svg?branch=master)](https://travis-ci.org/festinalent3/takeaway-challenge)  [![Coverage Status](https://coveralls.io/repos/github/festinalent3/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/festinalent3/takeaway-challenge?branch=master)



```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```


Task
-----

This is the second individual challenge for Makers academy, Ronin 2016 April cohort.

My task was to create a program, 'Take away' implementing the following user stories. I have used Twilio
API to implement text sending functionality needed when confirming an order to a customer.

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

Set up
-------------

I am using the [Dotenv gem](https://github.com/bkeepers/dotenv) to protect information from my Twilio account. I have included a .env template file where it is possible to simply replace the variable values with your token, sid, twilio nr and preferred cell phone nr.

Get your free Twilio account[here](https://www.twilio.com/)  


Functionality
-------------

The public interface of takeaway allow users to
* See a menu containing available dishes for takeaway
* Select what dish/dishes to order and specify their quantity. It is not possible to order something not on the menu
* Look at their current order
* Look at the current total price
* Place the order by specifying the amount to be paid. If the customer gives the wrong amount, they'll be notified immediately
* Users will also receive a text confirmation of their order after it has been placed

To create a new take away, simply do the following:

```
take_away = TakeAway.new
```

This will immediately enable all the functionality. Once an order is completed it will be saved to TakeAway's order history, and a new instance of Order class is automatically instantiated.


You can then call these methods on take_away:

```
take_away.dishes #Presents the menu

take_away.select(dish, quantity) #Adds dish and no of dishes to order

take_away.current_order #Shows what is included in the current order

take_away.total_cost #Returns the sum of the items in the current order

take_away.place_order(total_price) #Places the order and sends a text message confirmation

take_away.order_history #Shows past orders including their total cost
```


Food items (dishes) are created within the Menu class, which is simply a class extending Hash. So all menu objects are hashes containing information about the food item and the price of the item.

Text messages are handled by the Message class which implements the Twilio API.

The Order class takes care of order related tasks such as storing current food items to the order and calculating the total cost.

![irb feature test](https://github.com/festinalent3/takeaway-challenge/blob/master/images/irb.png "irb feature test")



Notes on Test Coverage
------------------

The Message class handles the calls to the Twilio API. The behavior of this class is tested using the [WebMock gem](https://github.com/bblimke/webmock), blocking all external HTTP requests during the unit testing. Because of Twilio/WebMock dependency issues I have mocked the behaviour of Twilio in the spec_helper.rb:13 file, by passing it a stubbed JSON string needed to resemble a Ruby hash in Twilio.

Test coverage has been slightly compromised since it is not possible to test 100% of the functionality in the Message class. For example exception handling needs an actual call to Twilio API to be implemented, which is not possible in the unit tests where external HTTP requests have been blocked in favor of not sending text messages.
