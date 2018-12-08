Takeaway challenge:

The purpose of this challenge is to build a program that will allow customers to place orders from a Takeaway.

Why this challenge exists:

"We would like to build a simple open source program that Takeaway restaurants can use to take advantage of online customers."

This challenge is my week 2 challenge at Makers. The challenge will allow me to practise everything we have explored over the last week.

* Designing Class with single responsiblity.

*

Key features:

Our program should allow customers to view a lit of dishes with prices.

The customer should be able to place an order from items on the menu.

The customer will be able to view the total of order. This will be verified against the list and prices previously displayed.

A confirmation email will be sent out to confirm delivery and time.  

 Development Process:

Set up project with

Started by going through the user stories
and taking it to a domain model using a table of objects and messages.

objects | Message
__________________
Takeaway| view_menu
Menu    |
Dishes  |

I then proceeded with the BDD cycle and featured tested what my outcome was expected from the user story using IRB. (I did create a feature test directory but was not sure on how to go about using it)

Test drive the creation of Takeaway that responded to a #view_menu. (Green)

The next step will be to get the #view_menu to return a list(menu) with dishes and prices.

 - create a list with dishes and prices
 A hash seems like the best option as it will allow me to have a key to value pairing. Dish => Price.

 - I am considering where my list will live. As it will have no real value for Takeaway unless called upon through #view_menu. My Takeaway class will only act as remote to command. I will create a new class for Menu to act as data store for my list.

- ran rubocop to clear offences
