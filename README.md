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

Of course, it was essential that these responsibilities where split
into other objects, and thus I created the Menu and Order class.

The menu class is fairly self explanatory, it contains a hash of
dishes and prices.

The order class is slightly more complex, when it is created, it
takes two arguments: a price, and any number of food items. It then
takes the list of items, iterates over them, checking their values
in the menu hash, before finally returning a final price.

##### Things I would like to add

Firstly, I couldn't get the Twilio Api to send out any text messages.
I'm sure with more time I could have got something to happen, but I
was aware of the time and decided that it would be better to spend
time refactoring rather than fiddling with a gem.

I would also have liked to have given the responsibility of checking the price
of the food against the price given to the order method to the order class, as
it should be.

##### Things I need to work on

Doubles. I thought I was there last week, but this exercise has made me realise
that I still don't consider them as my priority when the tests involve a class
that isn't the subject.

Rspec testing in general. I need to work on structure, contexts and general
syntax

##### A final word
However, despite the improvements needed, the program still achieves everything
laid out in the user stories. The user can see a menu, order food, check the
price matches the one given and, finally, receive a confirmation message that
their order is on it's way. Also, whilst it's not perfect, I think my
refactoring has improved considerable from previous exercises.

Author: Adam Browner
