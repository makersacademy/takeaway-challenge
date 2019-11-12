Takeaway Challenge
====================
This application can be used by a restaurant to create a menu, display it for customers, then allow them to create an order of specific items on it. When an order is created the customer inputs the total amount due, and the order is placed. An update can be issued to the customer by text message, letting them know their order is in process and an approximate delivery time, normally 1 hour after ordering

### Build Status
Currently classes have been created for items, menu and order. A message class has also been created for use with the text messaging API, but has currently not yet been implemented

### Tech/Framework Used
Built with Ruby version 2.6.3. Testing framework is Rspec and Rubocop.

### API Reference
Intended to make use of the Twilio sms API. Reference here: https://www.twilio.com/docs/sms/tutorials/how-to-send-sms-messages-in-ruby

### Tests
Tests have been created using Rspec. Currently tests use real instances of external classes (Chicago style) but the intention was to refactor these to make them independent (London style). Unfortunately I have now run out of time!

However, all tests are currently passing, and coverage is 100%.

To run tests, run rspec from within the project folder.

### How to Use?
#### Item class
This class is used for individual menu items.

When creating a new instance of an Item, the item's name and price are passed as arguments. The name and price can be called individually using the methods .name and .price respectively.

#### Menu class
This class is used to create a menu consisting of individual Items.

New items are added using the .add_item method. Items must be of the Item class to be added to a menu, otherwise an error will be returned.

The menu can be viewed using the .view_menu method, which returns a a list of all the menu items and their respective prices.

#### Order class
This class is used for making orders.

When creating a new order, the Menu class the order is being made from is passed as an argument.

Items are added to the order using the .add_item method. This first checks whether the item is on the menu, and if it is, adds the item name and quantity to the order list.

The .order_total method returns a total for all the items in the order list.

The .place_order method takes the total as an argument, checks whether it is correct, and if it is, places the order and returns a confirmation of placement, with a delivery time which is 1 hour from the current time.
