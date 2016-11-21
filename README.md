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
The Take Away application is part of a weekend challenge at the Makers Academy in London. I built my application with and OOP approach and the intent was to extract as many objects that I could identify.

The application allows a user to build a take away restaurant and add dishes to its menu and control the incoming orders.

A customer will be given a list of available dishes and the restaurant is able to take orders and add dishes to its order. The customer will be able get an order status with an overview of the selected dishes and the total cost of the order. At the checkout the customer will be sent a text message confirming the order and time of delivery which will be 1 hour after the order has been placed.

The application has an integrated text message confirmation system that uses the Twilio API. To be able to make the Twilio API to work add your Twilio account information to the confirmation.rb file.


Installation
-----
* Run the command 'bundle install' in the project directory to ensure you have all the gems.


How to use the applicaton
-----

To run the program require the dependencies.rb file from the project directory.

* Create your take away restaurant
  ``my_restaurant = Restaurant.new("name")``
* Start adding dishes with name, price and available amount to your menu
  ``my_restaurant.add_dish("Dish name", 12, 5)``
* Show the customer the menu with available dishes
  ``my_restaurant.show_menu``
* Add to an order by choosing dish number from the menu and amount
  ``my_restaurant.add_to_order(1, 3)``
* Let the customer get an order status
  ``my_restaurant.order_status``
* Checkout the order and send a text message confirmation to the customer
  ``restaurant.finish_order``

Areas to improve
-----

* Keep track of available dishes
* Edge cases
* Payment system
* Test environment
