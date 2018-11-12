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

 Overview
 -------

 A simple command-line Mexican takeaway ordering app for El Marraiachi Takeaway that allows the user to view a menu, order items, calculate the total and place an order. A text message is sent to the user to confirm.


 Instructions
 -----

 * Open your command-line - BASH or ZSH or similar - and navigate to the `takeaway-challenge/lib` directory
 * Load the app with:
 ```
   load 'takeaway.rb'
 ```
 * Create your Takeaway (eg my_takeaway):
 ```
   my_takeaway = Takeway.new
 ```
 * View the menu:
 ```
   my_takeaway.view_menu
 ```
 * Select items you want to add (including the quantity):
 ```
   my_takeaway.select('Beef Burrito', 2)
 ```
 * Check your order and the total spend so far:
 ```
   my_takeaway.check_order
 ```
 * Place you order and receive a text notification:
 ```
   my_takeaway.place_order
 ```
 * Enjoy your yummy Mexican cuisine! (Don't forget to order a beer to go with it!)
