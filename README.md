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

This programme allows a Takeaway to produce a menu and interactive interface for a customer to place an order with the takeaway. Once an order is placed and confirmed, the customer receives a message, sent using Twilio, to confirm their order.

Class
* Menu - The list of available items to order

Methods
+ valid_item - Ensures a user can only order available products
+ price - returns the price of a menu item

Class
* Order - The basket and payment of the customer

Methods
+ show_menu - prints the menu for a customer
+ add_to_basket - places items into a basket
+ review_order - uses private methods to return a full review of the order to the customer
+ checkout - Accepts payment and triggers confirmation text
+ order_total - private method for counting total items and prices in order
+ calculate_total - private method for return the total order of the customer
+ validate - checks payment matches total of order

Class
* Text - The confirmation text sent to the customer

Methods
+ send_text - Twilio data for conducting messaging
+ acct_sid - passing Twilio data
+ auth_token - passing Twilio data
+ message - private method setting the confirmation message
