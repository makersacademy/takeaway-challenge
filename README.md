# Takeaway Challenge

As part of this challenge we were instructed to follow a number of
user stories and create a takeaway program.

Before setting out various classes and objects to use, I decided to
create one main object, a Takeaway class, that achieved everything
I wanted it to before subtracting into other classes later on. As
such, the Takeaway class initially held a number of
responsibilities:

1. Allows the reader to look at a menu
2. Allows the reader to select any number of items of that menu
3. Checked the price of the food against the price that the user gave

Of course, it was essential that these responsibilties where split
into other objects, and thus I created the Menu and Order class.

The menu class is fairly self explanatory, it contains a hash of
dishes and prices.

The order class is slightly more complex, when it is created, it
takes two arguments: a price, and any number of food items. It then
takes the list of items, iterates over them, checking their values
in the menu hash, before finally returning a final price. 
