In this project, I aimed to create something similar to a restaurant all-in-one POS system. 

  There is a class for creating an item for the menu.
    For easy addition of items into existing menus

  Another for creating a menu, which is loaded when a new order class is created. 
    The idea behind this was that restaurant's often have seperate breakfast/lunch/dinner menus and so depending on the time of day, the create order request can load the relevant menu. 

The menu can be printed via a dedicated function, the items and quantities are manually typed in via the order function(and successfully stored if they are in the menu).

Setting up the functionality with Twilio's sms api was quite straightforward. One thing I am happy about is the creation of a fakeSMS class for testing purposes. 

I also learned to use a great gem dotenv to keep my twilio and phone number details private.