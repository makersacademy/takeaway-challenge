Takeaway Challenge
==================
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

# Airport Traffic Control System

This program is designed to manage Planes flying in and out of an airport. The airport has been created through the guidance of the user stories provided:

> As a customer,\
So that I can check if I want to order something,\
I would like to see a list of dishes with prices.

> As a customer,\
So that I can order the meal I want,\
I would like to be able to select some number of several available dishes.

> As a customer,\
So that I can verify that my order is correct,\
I would like to check that the total I have been given matches the sum of the various dishes in my order.

> As a customer,\
So that I am reassured that my order will be delivered on time,\
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

The idea of this program is to be able to place an order from a restuarant as a takeaway. You can see the menu, add show the order in progress, see the total whenever you'd like whilst ordering new food & recieve a text once you place the order with an estimated delivery date.

This system was built using the following [TDD](https://en.wikipedia.org/wiki/Test-driven_development#:~:text=Test%2Ddriven%20development%20(TDD),software%20against%20all%20test%20cases.).

## Installation
Fork or download this repo.\
Use `gem install bundler` to install the correct gems to use and test this code.\
When installation completes, run `bundle`.\
You may also need to install the Twilio gem, [you can install that here](https://www.twilio.com/docs/libraries/ruby).

## How To Use
Load `takeaway.rb` in with `irb`.\
Make a new instance of takeaway with `Takeaway.new`.\
Call `show_menu` to show the menu and the prices. (Yes, its a toast bar).\
Call `order_dishes(dish, quantity)` to order a dish and set a quantity of how many you'd like to order. The default quantity is 1.\
Call `show_order` to show what you have currently added to your order.\
Call `order_total` to show the current price total of the order. This value changes after you add an order to it.
Call `place_order` to place your order and send a text to the recipient.\

In order to send a text succesfully, you will need to register for the [Twilio API here](https://www.twilio.com/docs/sms). You will need to hop into `text.rb` to update:\
* `account_sid`
* `auth_token`
* `from:` phone number, (provided by Twilio).
* `to:` phone number of your choice.

## How To Test
Run `rspec` to run through tests.\
Run `rubocop` to run through code efficiency.

## Bugs/Future Changes To The Code
* Testing the sent text is still something I am working on. Currently the test doesn't really make sense as it is testing a mock which doesn't make sense right now, but it shall be fixed within the week.
* I would like to add a reset_order method to reset the order.
* I would like to add a method to place an order via text.