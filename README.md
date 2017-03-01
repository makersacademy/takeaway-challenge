# Takeaway Challenge
[![Coverage Status](https://coveralls.io/repos/github/tvfb85/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/tvfb85/takeaway-challenge?branch=master) [![Build Status](https://travis-ci.org/tvfb85/takeaway-challenge.svg?branch=master)](https://travis-ci.org/tvfb85/takeaway-challenge)
==================
```
                            _________
              r==           |       |
           _  //            |       |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```


About this project
---------

**Task:** Write a takeaway program which meets the requirements of the following user stories:

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


Usage
---------
Using a TDD approach, the design of the takeaway program evolved starting with an initial Restaurant class.

The Restaurant class delegates responsibility of its menu to a Menu class, responding to the function *'create_menu'* as indicated below:

```
2.3.1 :001 > require './lib/restaurant'
 => true
2.3.1 :002 > restaurant = Restaurant.new('Secret Garden')
 => #<Restaurant:0x007ffd8a28eeb8 @name="Secret Garden">
2.3.1 :003 > restaurant.create_menu('./lib/menu.csv')
 => #<Menu:0x007ffd8a27e0b8 @file="./lib/menu.csv", @menu=[]>
 ```

The Menu class accepts a CSV file upon initialization, which can be printed in a readable format for the user via the following command:

```
2.3.1 :004 > restaurant.display_menu
1. GUACAMOLE: avocado, coriander and tomato dip served with tortillas chips (3.5)
2. NACHOS: melted cheese, refried beans, pico de gallo, sour cream, jalapenos (6.5)
3. QUESADILLAS NATURALES: cheese only (4.95)
...
11. TACOS CAMARONES: shrimp and chilli-lime dressing (3.5)
12. FAJITAS CON VERDURAS: grilled vegetables served with soft tortillas (7.5)
13. FAJITAS CON CARNE ASADO: grilled beef served with soft tortillas (8.5)
14. ENCHILADAS VERDES: baked vegetable tortillas in green salsa topped with melted cheese (7.95)
```

To instantiate a new Order, call the restaurant's *'create order'* function:

```
2.3.1 :005 > myOrder = restaurant.create_order
```

Items from the menu can be added to this instance of an Order using *'add_items'*, passing in the **item name** and **quantity**, like so:

```
2.3.1 :006 > myOrder.add_items('Nachos', 3)
 => "3x NACHOS added"
 ```

The code prevents items not listed on the menu from being added:

```
2.3.1 :008 > myOrder.add_items('Tacos Asados', 1)
RuntimeError: We didn't recognise that, try again
```

Call the *'display_order'* function on the restaurant to see an itemised summary:

```
2.3.1 :009 > restaurant.display_order
Thank you. We're just fetching your order summary...
NACHOS x 3 = 19.50
TACOS CAMARONES x 1 = 3.50
 => "Your total is: £23.00"
```

If happy with the price calculation, the order can be placed:

```
2.3.1 :011 > restaurant.complete_order(+44xxxxxxxxx)
 ```

This action will trigger an SMS confirmation, which has been implemented using the Twilio API.


This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.
