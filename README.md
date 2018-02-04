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

How to run
---------

1. `git clone`
2. `gem install bundle` (if you don't have bundle already)
3. `bundle`
4. `irb`

How to use
-----

1. `require './lib/takeaway.rb'`
2. `require './lib/menu.rb'`
3. `require './lib/order.rb'`
4. `require './lib/message.rb'`
5. `takeaway = Takeaway.new` - Creates a new takeaway object
6. `takeaway.show_menu` - Prints the Menu
7. `takeaway.add_dish(dish, quantity)` - Pass the name of the dish you want to order and the quantity (defaults to 1 if no quantity given).
8. `takeaway.show_total` - Shows the total for all dishes added so far.
9. `takeaway.complete_order(phone_number)` - Will send a text to the given phone number. To use this feature you will need to create a .env file containing your twilio account_sid, auth_token, and twilio phone number.

User Stories
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
