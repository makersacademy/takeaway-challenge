#Takeaway Challenge

For this weeks challenge I first identified what objects would be required and what methods would need to be associated with them.
I decided that the main objects were dish, menu order and an interface object that would deal with creating these objects.

The dish object is reponsible for storing the name and price of a dish and the menu class is responsible for creating dish objects and storing them. 

The order class is responsible for storing information about the curent order. It is also responsible for confirming the order is correct and also handles sending a text if the order is complete.

Finally I created an Interface class to deal with creating a menu object and displaying what dishes are currently on the menu. It also has a place order method that creates a new order object which confirms the order and sends a text.

I also used the envyable gem to include the information for accessing the twilio as environmental variables rather than displaying them in the code. This was a suggestion that Michael Barry posted in the slack channel and was not something I was originally planning to do. 