# **_Takeaway Challenge_**
[![Build Status](https://travis-ci.org/benjamin-white/takeaway-challenge.svg?branch=master)](https://travis-ci.org/benjamin-white/takeaway-challenge)

<br>
Takeaway is a small program written in **Ruby** and comprised of the four classes _Takeaway_, _Menu_, _CurrentOrder_ & _Checkout_. The takeaway class acts as an interface for the other three which all supply helper functionality to it. The takeaway class is light and simply invokes the other three at the appropriate times. The checkout class uses the **Twilio** gem to send a text message confirming an order using the Twilio API.

The challenge is a fun way to learn about single responsibility, class extraction, dependency injection and encapsulation. It also demonstrated how nice Ruby's gem system is for setting up an API call.

The following user stories were provided by **Makers Academy** as a starting point for the project.

## _The User Stories &mdash;_

    As a customer
    So that I can check if I want to order something
    I would like to see a list of dishes with prices

    As a customer
    So that I can order the meal I want
    I would like to be able to select some number of several available dishes

    As a customer
    So that I can verify that my order is correct
    I would like to check that the total I have been given matches the sum of the     various dishes in my order

    As a customer
    So that I am reassured that my order will be delivered on time
    I would like to receive a text such as "Thank you! Your order was placed and     will be delivered before 18:52" after I have ordered

## _Domain Model &mdash;_

Objects  | Messages
------------- | -------------
Shop | *request_menu*
  |  *place_order*
  | *view_basket*
Menu  | *build_menu*
Order  |  *create_order*
  |  *calc_total*
  |  *display_order*
Basket  |  *confirm*
  | *reset_order*

## _Usage Instructions &mdash;_

- The program works with Ruby and the Twilio gem ``` gem install twilio ``` or ``` bundle install ``` if you have bundler.<br>
Once installed the program is run from the command line inside the project directory, simply ``` require './lib/takeaway' ``` from an irb or pry prompt.
- Then create an object to hold an instance of ``` Takeaway.new ```<br>
From there the following commands are available :<br>
  - ```.view_menu``` to see the current list of delights.
  - ```.place_order``` to add an item to your order. Supply a second integer argument if you want to add more than one.
  - ```.view_order``` to view the items currently in your order and the total price of the order.
  - ```.checkout``` to receive a text with estimated delivery time and to reset your basket.

## _Feature Tests &mdash;_

    [2] pry(main)> shop = Takeaway.new
    [3] pry(main)> shop.view_menu
    => "Pasta, Price : £4.50 // Garlic Bread, Price : £2.50 // Pizza, Price : £5.00 // Olives, Price : £1.50 // Ice cream, Price : £3.00 // Lemonade, Price : £1.00 // "
    [4] pry(main)> shop.place_order 'Marshmallow'
    => "Sorry, we don't currently offer that dish"
    [5] pry(main)> shop.checkout
    => "Sorry, you haven't placed an order yet!"
    [6] pry(main)> shop.place_order 'Garlic Bread'
    => 1
    [7] pry(main)> shop.place_order 'Lemonade', 2
    => 2
    [8] pry(main)> shop.view_order
    => "Garlic Bread, Quantity : 1 // Lemonade, Quantity : 2 //  Order Total : £4.5"
    [9] pry(main)> shop.checkout
    ## A text is dispatched by Twilio with a delivery ETA ##

## _Future Features &mdash;_

- More user control such as the ability to amend quantities, remove items or clear the basket.
- Allow the program to receive orders via text.
- Use two decimal place rounding when displaying order totals for better readability.
- Improve test coverage and enhance unit test credibility.
