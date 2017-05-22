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

Description
-------

Small piece of software that let a customer place and order to be delivered. The user can read trough the menu and select the desired dishes, check the order total, and then checkout. After checking out the user receives a confirmation SMS with the estimated delivery time.


Structure
-------
- Takeaway  
  - main class in charge of creating new orders
  - let the user read the Menu
  - let the user add products to the order
  - let the user check the total
  - sends a confirmation sms on checkout
- Order
  - add products to the order cart
  - show the total for the cart
- Menu
  - start as a empty menu
  - can add dishes to it
  - can print a list of dishes
  - can select a specific dish
- Dish
  - as a name attribute
  - as a price attribute
- Sms
  - uses Twilio API to send sms
  - calculates the estimated delivery time

Next Steps
-------
- Implement the ability to place orders via text message.
- Implement a takeaway.check_order method that returns a formatted list of the ordered products
- Create a Printer class to handle all the printing to the screen

What you need to use this software
---------
Clone this repository  
Ruby 2.4  
Bundle => gem bundle install  
run bundle install within the project folder to install the required depencies  

Test Framework & Extra
---------
RSpec 3.5.4  
Rubocop  
Twilio-ruby  
Dotenv  
