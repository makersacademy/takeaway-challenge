Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

User Stories
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

Instructions
-------
* Please note, the text function has been disabled in the code but can be reactivated by replacing the twilio account details in the send(message) method of the Text class.

Three classes have been created for this challenge. The Menu class holds information regarding the list
of food items available to order, as well as their corresponding prices. It also contains a price method
that returns the price of the menu item put in.

The restaurant class contains the methods that pull information from the menu and text class, and therefore has the ability to store dishes in an array, and when the order function is used, will call
the send(message) method from the Text class and send a sms detailing the arrival time of food.

Improvements and Known Issues:
-
