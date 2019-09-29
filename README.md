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
This programme allows a user to view a menu and select items by name and quantity, they can also #view_order basket which itemises each order selection in the format 'quantity x dish = total price'. The User can also see their total price or order, before confirming their order.

The basic programme is there, however it is not finished and needs further work

Further work
-----
Further work is required to implement the Twilio API to enable the user to receive a text message confirming the order from the restaurant and the estimated delivery time.

When calling #view_menu, Menu needs to be returned in a string format rather than hash

Prices/totals need to be converted to a 2 deciaml float. Tests updated accordingly

The #order_summary and #order_total methods need refactoring. They currenly require the menu prices which are within the Menu class. Find a way to reduce Order class dependency on Menu class. As a result of this complicated methods the Rspec tests for these methods have not been fully isolated.

Process
-----

view_menu --> select_menu_items --> view_all_selected items -->
confirm_order_selection --> get_sent_text_confirmation

User Story
-----
```
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
```
