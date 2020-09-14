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

 I started the challenge by thinking of the following classes and how they are supposed to be interracting with each other:

 - Dish class - should have a name and a price
 - Menu - should consist of different dishes
 - Order - should be passing on dishes and quantities and should be either able to place itself or raise an error; should also be able to show the total price of the order 
 - Restaurant - should be able to take the order and show the total of it and match it to the order total. If the order is correct should be able to send a text

 I have then decided to make dishes a constant and got rid of the Dish class and simply defined it as a constant withing a menu.

 
