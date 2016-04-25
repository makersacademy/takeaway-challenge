IRB Takeaway App Simulation
==================
```
                            _________
              r==           |       |
           _  //            |  M.B. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'
 
 ```
This is a simple program designed to mock a takeaway app. The program has one built-in restaurant with a menu (found in Diner.rb) and a few simple functions to make ordering easy.

Getting started
-------
* After downloading the files, require the Customer.rb file in IRB.
* Become a customer by setting your name equal to Customer.new.

Viewing a menu
-------
* Call view_menu on your customer name. You will be prompted with further instructions regarding how to order from the menu.

Confirming your order
-------
* IMPORTANT - Your order is not finalized until you call confirm_order. You can modify your order at any point before it is confirmed.
* Once confirmed, you will receive a text with a time estimate for your delivery!

Expanding your options
-------
* The view_menu function takes an optional argument specifying a restaurant. This defaults to Diner unless otherwise specified. If you would like to add more restaurants, simply add them in new classes, and make sure they have a readable menu variable, along with a print_items method to display it.
* Once passed as an argument to view_menu, the ordering commands will work with your new menu.