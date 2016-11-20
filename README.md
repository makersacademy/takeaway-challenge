Takeaway Challenge [![Build Status](https://travis-ci.org/TudorTacal/takeaway-challenge.svg?branch=master)](https://travis-ci.org/TudorTacal/takeaway-challenge)
==================
This project is our second weekend challenge at Makers Academy coding bootcamp.

Takeaway is a **command line app** and represents a food ordering system. It uses [Twilio's](https://www.twilio.com) API for text messaging to send a sms to the user at checkout.

The phone numbers and authentication id's are saved in ENV variables that are loaded at startup.

### Installation and Use

1. To run the program first run **bundle install**.
2. Open pry/irb and **require "./lib/take_away.rb"**.
3. Create a new TakeAway object that takes 2 arguments: Order and SMS.
```
take_away = TakeAway.new(Order, SMS)
```
* See an available menu of dishes with prices.
```
pry(main)> take_away.menu
=> {:chicken=>5, :beef=>6, :pork=>7}
```
* Add a dish and the quantity to basket.
```
pry(main)> take_away.add_to_basket("chicken",2)
=> "You added 2 x chicken to the basket."
```
* To checkout the order, give the total price as argument and if it matches the total price of the dishes, the app will send an sms with the time of the delivery.
```
take_away.checkout(10)
```

### Classes and Methods
 class **TakeAway(Order,SMS)**
 * menu - displays a list of dishes with prices
 * add_to_basket(dish,number)
   + the *dish* will come as a string
 * checkout(price)
   + it will check if the introduced price matches the total price of the dishes ordered and raises an error if they don't match.
   + sends a confirmation sms to the user

 class **Order** - has a Menu object injected
 * menu
 * add(dish,number)
 * total

 class **SMS**
 * new_client
  * creates a new Twilio client
 * text_message
  * send a custom text message to the user

 class **Menu** - contains a hash with dishes and prices
 * add (dish,price)
  * insert the dish as a string
 * remove_dish(dish)
  * insert the dish as a string

This repository was cloned from https://github.com/makersacademy/takeaway-challenge

### Contacts
tudor.tacal@gmail.com
