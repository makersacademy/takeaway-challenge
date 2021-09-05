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

Summary
-----

**The Restaurant**
* Dish
  * A dish is created with a name and a prince. 
  * Prices are input as a float with two decimal points.
  * Dishes can be itemised as a hash (itemise method).

* Menu
  * Dishes (itemised as a hash) can be added to the menu (add_to_menu(dish) method)
  * Menu can be viewed (view_menu method)
  * DEFAULT_MENU constant supplied, access with access_menu method
  * Added a banner for the takeaway cafe: "*** TDD Greasy Spoon ***"

**The Customer**
* Order
  * An order is initialized with an empty my_order array 
  * Dishes can be added one by one to the order, receives name and quantity as arguments (add_dish_to_order(name, quantity) method)
  * Cost of order calculated (order_total method)
  * Added view_order method for customer which includes cost of item 
  * Added how_much method to output total order cost


Notes
-----
 > Disappointed I couldn't figure out Twilio. it was asking me to pay for the account. 
 > Is there any recommended material I could look at? 
 > Noticed that `puts` works better in irb for view_order and view_menu but breaks my tests as nil becomes output
 > Also encountered problem with decimal points - should be limited 2dp throughout


 ```
  gem install twilio-ruby 

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