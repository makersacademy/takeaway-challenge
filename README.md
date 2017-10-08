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
 ## Delivery Order App
 Another Maker's weekend challenge which creates simple application for food ordering and notifies the user with an SMS for the expected delivery time. App uses Twilio API

## Classes

 - Dish
 > Creates the object dish which holds the name and the price

 - DishList
 > Holds a list of dishes

 - DishListParser
 > Reads a file with the available dishes, creates objecrts types of Dishes and parses them on a type of DishList list

 - Basket
 > Collects the items to be ordered 

 - Order
 > Orders the items and notifies the user with an SMS

 - Receipt
 > Creates a receipt of the ordered items

 - TwilioIntergration (module)
 > An abstraction layer for Twilio API
 
 - Defaults (module)
 > A list of default values for the app

 - Hidden (module)
 > Contains Twilio personal credencials and is not uploaded to repo