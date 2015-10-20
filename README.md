[![Build Status](https://travis-ci.org/chn-challenger/takeaway-challenge.png)](https://travis-ci.org/chn-challenger/takeaway-challenge)

Takeaway Challenge
==================

Completed Features
-------
* Dish class and test suites, can make dish objects which has name and price.
* Menu class and test suites, can make menus with name and add dish objects to menus, menu can display itself in a well formatted way.
* Stored some constants (line display lengths) in a module to be used in other classes.
* Order class and test suites, can make new order, add dishes with quantity to the order from a menu. Raise error when trying to order a dish not on the menu.  Order information can be displayed in a well formatted way, can also be displayed in a short form for sms.
* TextMessenger class and test suites, allow text messaging of order information with a delivery time through Twillio API.
* Takeaway class and test suites, can make individual takeaway objects that can take a menu and take multiple orders.
* Added an integration / feature capybara test suite where a takeaway is created with a suitable menu of dishes, orders made from the menu at the takeaway.

Twillio text screenshot
-----
_Text message display has since improved_
![](http://i.imgur.com/jS1B2dE.png)
