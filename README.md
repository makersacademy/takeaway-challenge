
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

###**Improvements**


####**Tests**


https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master
