
#**Takeaway challenge**

##*Introduction*

The aim of this weeks challenge was to create a takeaway menu that an individual could place an order from, ideally implementing a text confirmation service. The complexities revolved around ensuring an individual could order more than one of an item from the menu, and also different items.

###*Installation*

The program uses the following:
- version 2.2.1 of Ruby
- gem twilio-ruby 4.5.0
- sinatra 1.4.6

To enable the user interface, I created a ruby file called feature.rb. When in IRB this enables the functionality of the code to be tested without using method calls. By running the .rb file you can see the functionality of the program. An earlier version of ruby was used, due to it being a stable version for the twilio functionality.

###**Approach**

I believe the challenge warranted 2/3 classes. One for the menu, one for the order and potentially one for verifying and sending the confirmation text message. I started by drafting out the two objects 'menu' & 'order' as classes and looking at the messages required between the two classes.

Initially, I built some basic functionality into the Menu class, enabling upon initialisation the creation of a basic menu, with the ability to view this menu list, add items and remove menu items.

Appraoching the order class, I created a start_order method with argument for the menu item to be added. This creates via injection a menu class, that then selects the details associated to the chosen item and calculates the line cost.

If an item is selected, this is chosen via the next item method. The order total method collates the total cost of the order and the confirmation creates the body of text for the twilio text. Finally, send_text creates a Verify class and sends a confirmation text of the order.

Manipulating the subsequent hashes was a challenge, as was the dependency injection of the menu class.

###**Improvements**
- removing hardwired menu
- error methods for incorrect choice selection
- presentation of order - removing hash
- I'm not sure it follows the SRP

####**Tests**
There is not adequate testing of the verify class, with a stub for the twilio functionality.

[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
