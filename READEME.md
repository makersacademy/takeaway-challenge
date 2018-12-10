
objects | Message
__________________
Takeaway| view_menu
Menu    |
Dishes  |


Test drive the creation of Takeaway that responded to a #view_menu. (Green)

The next step will be to get the #view_menu to return a list(menu) with dishes and prices.

 - create a list with dishes and prices
 A hash seems like the best option as it will allow me to have a key to value pairing. Dish => Price.

 - I am considering where my list will live. As it will have no real value for Takeaway unless called upon through #view_menu. My Takeaway class will only act as remote to command. I will create a new class for Menu to act as data store for my list.

- ran rubocop to clear offences
