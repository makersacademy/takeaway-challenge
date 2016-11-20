Take Away application
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

Introduction
-------
The application allows a user to build a take away restaurant and add dishes to its menu. A customer will be given a list of available dishes and the restaurant is able to take orders and add dishes to its order. The customer will be able get an order status and make sure everything is correct according to the order. When checking out the order the customer will be given an overview of the order and the total of the order. Further the customer will be sent a text message confirming the order and time of delivery.
The application has an integrated text message confirmation system that uses the Twilio API.


Installation
-----
* Run the command 'bundle install' in the project directory to ensure you have all the gems.


How to use the applicaton
-----

To run the program require the dependencies.rb file.

* Create your take away restaurant
  my_restaurant = Restaurant.new
* Start adding dishes with name, price and available amount to your menu
  my_restaurant.add_dish("my_dish", 12, 5)
* Show the customer the menu with available dishes
  my_restaurant.show_menu
* Start an order
  restaurant.start_order
* Add to the order by choosing dish number from the menu and amount
  restaurant.add_to_order(1, 3)
* Let the customer get an order status
  restaurant.order_status
* Checkout the order and send a text message confirmation to the customer
  restaurant.finish_order

Areas to improve
-----

* Keep track of available dishes
* Edge cases
* Test environment
