Takeaway Challenge
==================

Task Overview
-------------

The objective of this task is to build a takeaway program capable of:
* Displaying a menu of dishes with prices
* Composing an order of dishes
* Calculating the order total
* Texting the customer when the order is confirmed

Project Structure
-----------------

There are five classes in this program:

* Takeaway
  * Is interacted with by the user
  * Initializes with menu and order instances
  * Displays the menu for the customer
  * Copies items from the menu to the order
* Menu
  * Initializes with an example menu (array) of prepared dishes
* Order
  * Initializes with an empty basket
  * Adds and removes dishes from the basket
  * Calculates the basket total
* Dish
  * Initializes each dish with a name and price
  *  Module of example dishes exists
* Message
  * Initializes with:
    * account sid
    * auth token
    * client
    * to/from numbers
  * Can send messages, passing a message body
  * Is instantiated when checkout is called


