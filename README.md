Takeaway Challenge [![Build Status](https://travis-ci.org/giamir/takeaway-challenge.svg?branch=master)](https://travis-ci.org/giamir/takeaway-challenge)
=================

Task
-----
Write a Takeaway program with the following user stories:

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

Solution
---------
I solved this challenge using 4 classes:

* TakeAway
* Order
* Menu
* TextProvider

### TakeAway class

> __This is the only class the user should use.__

These are the public messages you can send to an object TakeAway.

* **initialize(args)**
when you create an instance of takeaway you have to specify in a hash some parameters.
__menu:__ an instance of the Menu class which provides available dishes for TakeAway
__order_klass:__ the class Order to make TakeAway able to generate instances of Order
__text_provider_klass:__ the class TextProvider to make TakeAway able to generate a TextProvider instance
__config:__ an hash containing all the parameters needed to config the Twilio TextProvider instance to send message.
* **add_to_order(dish, quantity = 1)** it create a new order if no order is already set. Adds a quantity of dish to the order.
* **basket** show the basket of the actual order.
* **complete_order(amount)** place the order if the amount given is the same of the order amount. Send a reminder sms to the customer using Twilio-Ruby gem.

### Order class

> __This class should not be use by the user.__

These are the public messages you can send to an object Order.

* **initialize(menu)** initialize a new instance of Order with a menu instance parameter which provides available dishes for Order.
* **show_basket** shows the basket of the order.
* **add(dish, quantity)** adds a quantity of dish to the order.
* **total** return the total amount you have to pay for the order.

### Menu class

> __This class could be use by the user. It does not have any dependencies.__

These are the public messages you can send to an object Menu.

* **add_dish(dish, price)** adds a dish with relative price to the menu.
* **remove_dish(dish)** removes a dish from the menu.
* **has?(dish)** returns true if the dish is available.
* **dishes** returns a duplicate of the hash available in the menu.
* **to_s** pretty prints of the class menu.

### TextProvider

> __This class should not be use by the user.__

These are the public messages you can send to an object TextProvider.

* **initialize(config)** create a new instance of TextProvider and sets up all the needed parameters to make the Twilio Gem works.
config is an hash with the following keys:
__account_sid:__, __auth_token:__, __from:__, __to:__, __body:__

* **deliver** sends a new message using the config parameter given



Example
--------
```

```

Contributors
-------------
[Giamir Buoncristiani](https://github.com/giamir)
