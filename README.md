Takeaway Challenge
==================

Approach taken
--------------

All interaction between the customer and the application is through the ```Takeaway``` class which then passes messages to the other objects as necessary.

I have implemented a ```DishList``` class (distinct from the ```Menu``` class) which has the menu items hard-coded. The idea behind this is that in the real world there would be a database that would contain the restaurant's current menu items, so the data would be taken from there. When an item number is entered the ```DishList``` class returns the actual ```Dish``` object that the item number relates to.
